// Annotated pseudocode for:
//
//   unsigned int wgtochina_lb(int wg_flag,
//                            unsigned int wg_lng,
//                            unsigned int wg_lat,
//                            int wg_heit,
//                            int wg_week,
//                            unsigned int wg_time,
//                            unsigned int *china_lng,
//                            unsigned int *china_lat)
//
// Binary:
//   mapenv_02changsha.bin
//
// Symbol address:
//   0x710e60
//
// Disassembly:
//   25_wgtochina_lb_disassembly.asm
//
// Source path recovered from .rodata:
//   /home/a/mapenv/encryption-map/src/gnss_encrypt.cpp
//
// Original source comments are not present in the binary. Comments below are
// converted from symbols, strings, constants, and ARM64 control flow.

#include <math.h>
#include <stdint.h>

// Return values recovered from control flow.
static const unsigned int WGTOCHINA_OK = 0;
static const unsigned int WGTOCHINA_INPUT_ERROR = 0xffff95ffU; // signed: -27137

// Input/output coordinate scale. wg_lng/wg_lat and china_lng/china_lat are
// integer coordinates in degrees * 1e7.
static const double kCoordScale = 10000000.0;

// Valid input range loaded by wgtochina_lb from .rodata offsets 0x9d1d60..0x9d1d78.
static const double kMinLng = 115.73278000000001;
static const double kMaxLng = 117.85876;
static const double kMinLat = 38.515270000000001;
static const double kMaxLat = 40.410240000000002;

// Decimal grid adjustment constants.
static const double kGridScaleA = 100000.0;
static const double kGridScaleB = 1000000.0;
static const double kGridFractionScale = 0.1;
static const double kGridUnitA = 0.00001;
static const double kGridUnitB = 0.000001;

// GCJ-like transform constants.
static const double kPi = 3.1415926535897931;
static const double kDegToRad = 0.017453292519943299; // pi / 180
static const double kEarthEccentricitySq = 0.00669342;
static const double kEarthSemiMajorAxis = 6378245.0;
static const double kEarthLatDenominator = 19903725.9;
static const double kCenterLng = 105.0;
static const double kCenterLat = 35.0;

// Extra elevation correction factor loaded from 0x9ae8e0.
static const double kElevationFactor = 0.001;

// State object layout inferred from stores at b27000 + 0x8a8.
// The original type/name is not available in the binary.
struct EncryptStateGuess {
    unsigned int current_time; // +0, set to wg_time before JudgeSD()
    unsigned int prev_time;    // +4, used by JudgeSD()
    double lng0;               // +8
    double lng1;               // +16
    double lat0;               // +24
    double lat1;               // +32
    double counter;            // +40, initialized to 3.0
};

extern EncryptStateGuess g_encrypt_state_guess;

// Symbol-backed helper functions visible in the binary.
extern int JudgeSD();
extern double Elev_Inter(double lng, double lat);
extern double EncrpytLonLatA(double x, double y);
extern double EncrpytLonLatB(double x, double y);
extern double encrpytTL(double rad);

// Error path at 0x710f20..0x710f38.
static unsigned int return_input_error(unsigned int *china_lng,
                                       unsigned int *china_lat)
{
    *china_lng = 0;
    *china_lat = 0;
    return WGTOCHINA_INPUT_ERROR;
}

// Inline arithmetic recovered from 0x710f50..0x71103c.
// It adjusts a decimal coordinate by splitting it into 1e5/1e6 buckets.
static double grid_adjust(double value)
{
    double scaled_a = value * kGridScaleA;
    double scaled_b = value * kGridScaleB;

    int bucket_a = (int)scaled_a;
    int bucket_b = (int)scaled_b;

    double bucket_a_double = (double)bucket_a;
    double bucket_b_double = (double)bucket_b;

    double fraction = (scaled_b - bucket_b_double) * kGridFractionScale;
    double decimal_digit = bucket_b_double - bucket_a_double * 10.0;

    if ((int)decimal_digit <= 4) {
        return (bucket_a_double + fraction) * kGridUnitA;
    }

    return ((bucket_a_double * 10.0 + 5.0) * kGridUnitB) +
           (fraction * kGridUnitA);
}

unsigned int wgtochina_lb(int wg_flag,
                          unsigned int wg_lng,
                          unsigned int wg_lat,
                          int wg_heit,
                          int wg_week,
                          unsigned int wg_time,
                          unsigned int *china_lng,
                          unsigned int *china_lat)
{
    // 1) Validate GPS week and height.
    //
    // Assembly:
    //   sub w4, w4, #0x96c
    //   cmp w4, #0x1c
    //   b.hi error
    //
    // This is an unsigned check, so wg_week must be in [2412, 2440].
    if ((unsigned int)(wg_week - 2412) > 28U) {
        return return_input_error(china_lng, china_lat);
    }

    if (wg_heit > 5000) {
        return return_input_error(china_lng, china_lat);
    }

    // 2) Convert integer coordinates to degree coordinates and validate range.
    double lng = (double)wg_lng / kCoordScale;
    if (lng < kMinLng || lng > kMaxLng) {
        return return_input_error(china_lng, china_lat);
    }

    double lat = (double)wg_lat / kCoordScale;
    if (lat < kMinLat || lat > kMaxLat) {
        return return_input_error(china_lng, china_lat);
    }

    // 3) Initialization path.
    //
    // If wg_flag == 0, the function initializes global history/state and
    // directly returns the original coordinate integers.
    if (wg_flag == 0) {
        g_encrypt_state_guess.lng0 = (double)wg_lng;
        g_encrypt_state_guess.lng1 = (double)wg_lng;
        g_encrypt_state_guess.lat0 = (double)wg_lat;
        g_encrypt_state_guess.lat1 = (double)wg_lat;
        g_encrypt_state_guess.counter = 3.0;

        *china_lng = wg_lng;
        *china_lat = wg_lat;
        return WGTOCHINA_OK;
    }

    // 4) Runtime state check.
    //
    // wg_time is stored into global state and JudgeSD() decides whether the
    // current step is acceptable. JudgeSD() returning -1 triggers the same
    // input-error path.
    g_encrypt_state_guess.current_time = wg_time;
    if (JudgeSD() == -1) {
        return return_input_error(china_lng, china_lat);
    }

    // 5) Decimal/grid adjustment before applying the coordinate transform.
    double grid_lng = grid_adjust(lng);
    double grid_lat = grid_adjust(lat);

    // 6) Compute transform deltas. Constants 105 and 35 are typical in
    // GCJ-style coordinate offset formulas.
    double x = grid_lng - kCenterLng;
    double y = grid_lat - kCenterLat;

    double delta_lng = EncrpytLonLatA(x, y);
    double delta_lat = EncrpytLonLatB(x, y);

    // Elev_Inter() contributes a small correction to both deltas.
    double elevation = Elev_Inter(grid_lng, grid_lat);
    delta_lng += elevation * kElevationFactor;
    delta_lat += elevation * kElevationFactor;

    // 7) Convert deltas from meters-like units to degree offsets.
    //
    // encrpytTL(rad_lat) behaves as a sine-like helper. The assembly computes:
    //   magic = 1.0 - ee * sin_like(rad_lat)^2
    double rad_lat = grid_lat * kDegToRad;
    double sin_like = encrpytTL(rad_lat);
    double magic = 1.0 - kEarthEccentricitySq * sin_like * sin_like;
    double sqrt_magic = sqrt(magic);

    double transformed_lng =
        grid_lng +
        (delta_lng * 180.0) /
            ((kEarthSemiMajorAxis / sqrt_magic) * cos(rad_lat) * kPi);

    double transformed_lat =
        grid_lat +
        (delta_lat * 180.0 * magic * sqrt_magic) / kEarthLatDenominator;

    // 8) Return integer coordinates in degrees * 1e7.
    //
    // The binary uses fcvtzu, so the conversion truncates toward zero to an
    // unsigned integer.
    *china_lng = (unsigned int)(transformed_lng * kCoordScale);
    *china_lat = (unsigned int)(transformed_lat * kCoordScale);

    return WGTOCHINA_OK;
}
