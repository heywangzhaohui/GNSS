// Clean annotated pseudocode for:
//   doEncrypt(long, double const&, double const&, double const&, double&, double&)
// Address:
//   0x711660
//
// This is NOT buildable source code recovered from the original project.
// It is a readable reconstruction from the ARM64 disassembly in:
//   23_doencrypt_disassembly.asm
//
// Reading rules:
// - Names ending in "_guess" are inferred names, not original symbols.
// - Symbol names found in the binary are kept as-is, including the original
//   typo in EncrpytLonLatA / EncrpytLonLatB / encrpytTL.
// - The main body follows doEncrypt's real control flow. Some inline arithmetic
//   blocks are factored into helpers only to make the recovered logic readable.

#include <stdint.h>
#include <time.h>

// Confirmed constants decoded from .rodata or ARM64 immediates.
static const double kScale1e7 = 10000000.0;
static const double kLonMinChinaGuess = 72.004;
static const double kLonMaxChinaGuess = 137.8347;
static const double kLatMinChinaGuess = 0.8293;
static const double kLatMaxChinaGuess = 55.8271;
static const double kDegToRad = 0.017453292519943299; // pi / 180
static const double kEarthEccentricitySq = 0.00669342;
static const double kEarthSemiMajorAxis = 6378245.0;
static const double kEarthFormulaDenominator = 19903725.9;
static const double kGcjLonCenter = 105.0;
static const double kGcjLatCenter = 35.0;

// These constants are used by the inline grid/fraction code.
static const double kGridScaleA = 100000.0;
static const double kGridScaleB = 1000000.0;
static const double kGridUnitA = 0.00001;
static const double kGridUnitB = 0.000001;

// Symbol-backed functions visible in the binary.
extern void UTC2GPS(int year,
                    int month,
                    int day,
                    int hour,
                    int minute,
                    int second,
                    int& gps_a,
                    int& gps_b);
extern int JudgeSD();
extern double Elev_Inter(double lon, double lat);
extern double EncrpytLonLatA(double x, double y);
extern double EncrpytLonLatB(double x, double y);
extern double encrpytTL(double rad);

// Global state locations inferred from stores/loads:
// - g_encrypt_first_run_guess is the byte at b16000 + 3616.
// - g_encrypt_state_guess starts near b27000 + 0x8a8.
struct EncryptStateGuess {
    int unknown0;
    int time_or_gps_value;
    double lon_prev0;
    double lon_prev1;
    double lat_prev0;
    double lat_prev1;
    double counter;
};

extern unsigned char g_encrypt_first_run_guess;
extern EncryptStateGuess g_encrypt_state_guess;

// The function logs this message on parameter/state failure:
//   "wgtochina_lb input parameter error"
static void log_input_parameter_error_guess();

// 0x711660..0x7116d4:
// The first argument is divided by 1000 using signed magic-number division:
//   smulh/asr/sub with magic 0x20c49ba5e353f7cf
// This is the standard optimized pattern for timestamp_raw / 1000.
// The result is stored on the stack and passed by address to gmtime().
static time_t normalize_timestamp_guess(long timestamp_raw)
{
    return (time_t)(timestamp_raw / 1000);
}

// 0x71171c..0x711784:
// The binary does:
//   value * 60.0 * 60.0
//   fcvtzu wN, dN, #10
//   ucvtf dN, wN
//
// ARM64 "fcvtzu ..., #10" means unsigned fixed-point conversion:
//   integer = trunc(value * 60.0 * 60.0 * 2^10)
// The integer is then converted back to double and divided by 10000000.0.
static double quantize_scaled_integer_guess(double value)
{
    return (double)(uint32_t)(value * 60.0 * 60.0 * 1024.0);
}

// 0x711890..0x711970:
// The code splits lon/lat into decimal buckets using 100000 and 1000000,
// then applies either a 1e-5 or 1e-6 unit. It is represented as helpers here
// because the transformation is inline and branchy in the real function.
static double grid_adjust_lon_guess(double lon)
{
    int bucket_a = (int)(lon * kGridScaleA);
    int bucket_b = (int)(lon * kGridScaleB);
    double frac_b = (lon * kGridScaleB - (double)bucket_b);
    double base = (double)bucket_b - (double)bucket_a * 10.0;

    if ((int)base <= 4) {
        return ((double)bucket_a + frac_b) * kGridUnitA;
    }

    return (base + 5.0) * kGridUnitB + frac_b * kGridUnitA;
}

static double grid_adjust_lat_guess(double lat)
{
    int bucket_a = (int)(lat * kGridScaleA);
    int bucket_b = (int)(lat * kGridScaleB);
    double frac_b = (lat * kGridScaleB - (double)bucket_b);
    double base = (double)bucket_b - (double)bucket_a * 10.0;

    if ((int)base <= 4) {
        return ((double)bucket_a + frac_b) * kGridUnitA;
    }

    return (base + 5.0) * kGridUnitB + frac_b * kGridUnitA;
}

static int check_time_and_extra_guess(int gps_a, double in_extra)
{
    // 0x71170c..0x711718 checks:
    //   (gps_a - 2412) <= 28
    //   (int)in_extra <= 5000
    //
    // The signed/unsigned condition is encoded through cmp/ccmp/b.gt. This is
    // the readable intent, not a formal proof of all edge cases.
    if ((gps_a - 0x96c) > 0x1c) {
        return 0;
    }

    if ((int)in_extra > 5000) {
        return 0;
    }

    return 1;
}

// Reconstructed function body.
// Confirmed return convention:
//   1 = success
//   0 = input/state/range failure
int doEncrypt_annotated(long timestamp_raw,
                        const double& in_lon_ref,
                        const double& in_lat_ref,
                        const double& in_extra_ref,
                        double& out_lon_ref,
                        double& out_lat_ref)
{
    // 1) Time preprocessing.
    //
    // Assembly:
    //   timestamp_seconds = timestamp_raw / 1000
    //   7116d8: bl gmtime@plt
    //   7116f8: bl UTC2GPS(...)
    time_t normalized_time = normalize_timestamp_guess(timestamp_raw);
    struct tm* tm_value = gmtime(&normalized_time);

    int gps_a = 0;
    int gps_b = 0;
    UTC2GPS(tm_value->tm_year + 1900, // x0
            tm_value->tm_mon + 1,    // x1
            tm_value->tm_mday,       // x2
            tm_value->tm_hour,       // x3
            tm_value->tm_min,        // x4
            tm_value->tm_sec,        // x5
            gps_a,                   // [sp + 0x80], checked immediately
            gps_b);                  // [sp + 0x84], later written to state

    // 2) Third input and time-derived range check.
    if (!check_time_and_extra_guess(gps_a, in_extra_ref)) {
        log_input_parameter_error_guess();
        return 0;
    }

    // 3) Quantize lon/lat-like inputs to scaled integer form, then derive
    //    double coordinates by dividing by 1e7.
    //
    // Important: the scaled integer is produced with binary fixed-point
    // conversion, not normal decimal rounding.
    double raw_lon_scaled = quantize_scaled_integer_guess(in_lon_ref);
    double quantized_lon = raw_lon_scaled / kScale1e7;

    if (quantized_lon < kLonMinChinaGuess || quantized_lon > kLonMaxChinaGuess) {
        log_input_parameter_error_guess();
        return 0;
    }

    double raw_lat_scaled = quantize_scaled_integer_guess(in_lat_ref);
    double quantized_lat = raw_lat_scaled / kScale1e7;

    if (quantized_lat < kLatMinChinaGuess || quantized_lat > kLatMaxChinaGuess) {
        log_input_parameter_error_guess();
        return 0;
    }

    // 4) First-call initialization.
    //
    // Assembly:
    //   if (*(b16000 + 3616) != 0) {
    //       state[+8/+16]  = raw_lon_scaled;
    //       state[+24/+32] = raw_lat_scaled;
    //       state[+40]     = 3.0;
    //       output         = raw_scaled / 1e7;
    //       flag           = 0;
    //       return 1;
    //   }
    if (g_encrypt_first_run_guess != 0) {
        g_encrypt_state_guess.lon_prev0 = raw_lon_scaled;
        g_encrypt_state_guess.lon_prev1 = raw_lon_scaled;
        g_encrypt_state_guess.lat_prev0 = raw_lat_scaled;
        g_encrypt_state_guess.lat_prev1 = raw_lat_scaled;
        g_encrypt_state_guess.counter = 3.0;

        out_lon_ref = raw_lon_scaled / kScale1e7;
        out_lat_ref = raw_lat_scaled / kScale1e7;
        g_encrypt_first_run_guess = 0;
        return 1;
    }

    // 5) Subsequent-call state check.
    //
    // The binary stores a GPS/time-derived value into the global state and calls
    // JudgeSD(). A return value of -1 means failure.
    g_encrypt_state_guess.time_or_gps_value = gps_b;
    if (JudgeSD() == -1) {
        log_input_parameter_error_guess();
        return 0;
    }

    // 6) Inline decimal/grid adjustment.
    //
    // In the binary this is not a function call; it is the arithmetic between
    // 0x711890 and 0x711970.
    double grid_lon = grid_adjust_lon_guess(quantized_lon);
    double grid_lat = grid_adjust_lat_guess(quantized_lat);

    // 7) GCJ-like transform core.
    //
    // Constants and calls are visible in the assembly:
    //   x = grid_lon - 105.0
    //   y = grid_lat - 35.0
    //   EncrpytLonLatA(x, y)
    //   EncrpytLonLatB(x, y)
    //   Elev_Inter(grid_lon, grid_lat)
    //   encrpytTL(grid_lat * pi / 180)
    double x = grid_lon - kGcjLonCenter;
    double y = grid_lat - kGcjLatCenter;

    double delta_lon = EncrpytLonLatA(x, y);
    double delta_lat = EncrpytLonLatB(x, y);

    double elevation_term = Elev_Inter(grid_lon, grid_lat);

    // This factor is loaded from 0x9ae000 + 2272. The exact semantic name is
    // unknown, so it remains a placeholder.
    extern double g_elevation_factor_guess;
    delta_lon += elevation_term * g_elevation_factor_guess;
    delta_lat += elevation_term * g_elevation_factor_guess;

    double rad_lat = grid_lat * kDegToRad;
    double trig_term = encrpytTL(rad_lat);
    double magic = 1.0 - kEarthEccentricitySq * trig_term;
    double sqrt_magic = __builtin_sqrt(magic);

    // 8) Apply the coordinate offsets and return quantized outputs.
    //
    // Longitude-like output:
    //   out = (grid_lon + delta_lon * 180 /
    //          ((6378245 / sqrt_magic) * cos(rad_lat) * pi)) * 1e7
    //
    // Latitude-like output:
    //   out = (grid_lat + delta_lat * 180 * magic * sqrt_magic /
    //          19903725.9) * 1e7
    //
    // The binary converts these to unsigned integer and then back to double
    // before writing and dividing by 1e7.
    double lon_scaled =
        (grid_lon +
         (delta_lon * 180.0) /
             ((kEarthSemiMajorAxis / sqrt_magic) *
              __builtin_cos(rad_lat) *
              3.1415926535897931)) *
        kScale1e7;

    double lat_scaled =
        (grid_lat +
         (delta_lat * 180.0 * magic * sqrt_magic) / kEarthFormulaDenominator) *
        kScale1e7;

    // The stores reuse the same output block as the first-call path:
    //   store integer-coded double -> divide by 1e7 -> store final double.
    out_lon_ref = (double)(uint32_t)lon_scaled / kScale1e7;
    out_lat_ref = (double)(uint32_t)lat_scaled / kScale1e7;
    return 1;
}
