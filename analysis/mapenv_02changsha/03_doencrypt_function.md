# 专注函数：`doEncrypt`

本文只看一个函数：

```text
doEncrypt(long, double const&, double const&, double const&, double&, double&)
地址：0x711660
完整反汇编：23_doencrypt_disassembly.asm
注释版伪代码：doencrypt_annotated_pseudocode.cpp
```

上一份 `02_encrypt_walkthrough.md` 是围绕加密链路讲思路；这一份只服务于你在本地反编译器里逐行看 `doEncrypt`。

## 1. 参数映射

符号签名：

```cpp
doEncrypt(long, double const&, double const&, double const&, double&, double&)
```

ARM64 下前 6 个参数进入函数时在 `x0..x5`：

| 原始寄存器 | 保存后寄存器 | 建议临时命名 | 说明 |
| --- | --- | --- | --- |
| `x0` | - | `timestamp_raw` | 时间输入，会先换算后传 `gmtime`/`UTC2GPS` |
| `x1` | `x23` | `in_lon_ref` | `const double&`，后续量化到 `d8` |
| `x2` | `x21` | `in_lat_ref` | `const double&`，后续量化到 `d10` |
| `x3` | `x25` | `in_extra_ref` | `const double&`，先转整数并参与范围检查 |
| `x4` | `x22` | `out_lon_ref` | `double&` 输出 |
| `x5` | `x24` | `out_lat_ref` | `double&` 输出 |

入口保存参数的位置：

```asm
7116a4: mov x21, x2
7116a8: mov x22, x4
7116b4: mov x23, x1
7116b8: mov x24, x5
7116c0: mov x25, x3
```

## 2. 函数返回值

`w0` 是返回值：

| 返回值 | 分支 |
| --- | --- |
| `1` | 成功 |
| `0` | 输入参数错误、状态检查失败或范围检查失败 |

错误路径：

```asm
7117fc: ... LogMessage(...)
711834: mov w0, #0
```

成功路径：

```asm
7117e0: mov w0, #1
```

## 3. 基本块拆解

### 3.1 时间预处理：`0x711660..0x7116f8`

函数先对 `timestamp_raw` 做魔数除法。`0x20c49ba5e353f7cf` 配合 `smulh/asr/sub` 是有符号除以 `1000` 的优化模式，因此这里可以理解为：

```cpp
timestamp_seconds = timestamp_raw / 1000;
```

随后调用：

```asm
7116d8: bl gmtime@plt
7116f8: bl UTC2GPS(int, int, int, int, int, int, int&, int&)
```

可以暂时理解为：

```cpp
auto t = timestamp_raw / 1000;
auto tm = gmtime(&t);
UTC2GPS(tm->year, tm->month, tm->day, tm->hour, tm->min, tm->sec,
        gps_a, gps_b);
```

这里的 `gps_a/gps_b` 后续会参与状态检查：

```asm
711878: ldr w1, [sp, #132]
711880: str w1, [global + 2216]
711884: bl JudgeSD
```

### 3.2 第三个输入的范围检查：`0x7116fc..0x711718`

```asm
7116fc: ldr d0, [x25]
711708: fcvtzs w0, d0
71170c: sub w1, w1, #0x96c
711710: cmp w1, #0x1c
711714: ccmp w0, #0x1388, #0x0, ls
711718: b.gt 7117fc
```

含义：

- `*in_extra_ref` 转整数；
- `gps/时间派生值 - 0x96c` 必须不超过 `0x1c`；
- `*in_extra_ref` 的整数值必须不超过 `5000`；
- 失败跳到错误返回。

### 3.3 输入经纬度量化：`0x71171c..0x71179c`

输入 1：

```asm
71171c: ldr d0, [x23]
711734: fmul d0, d0, d3
711740: fmul d0, d0, d3
711744: fcvtzu w0, d0, #10
711748: ucvtf d0, w0
71174c: fdiv d8, d0, 10000000.0
```

输入 2：

```asm
711768: ldr d1, [x21]
711774: fmul d1, d1, d3
711778: fmul d1, d1, d3
71177c: fcvtzu w0, d1, #10
711780: ucvtf d1, w0
711784: fdiv d10, d1, 10000000.0
```

其中 `d3 = 60.0`，`fcvtzu ..., #10` 是无符号固定点转换。可读作：

```cpp
raw_scaled = trunc_unsigned(input * 60.0 * 60.0 * 1024.0);
quantized = raw_scaled / 10000000.0;
```

最终 `d8/d10` 是经纬度量化后的 double。

建议命名：

```text
d8  = quantized_lon
d10 = quantized_lat
```

### 3.4 粗范围检查：`0x711750..0x71179c`

常量来自 `22_encrypt_constants_decoded.txt`：

```text
115.73278
117.85876
38.51527
40.41024
```

对应：

```cpp
if (quantized_lon < 115.73278 || quantized_lon > 117.85876) return false;
if (quantized_lat < 38.51527 || quantized_lat > 40.41024) return false;
```

这是实际加载的局部区域范围过滤，对应地址 `0x9d1d60..0x9d1d78`。

### 3.5 首次调用分支：`0x7117a0..0x7117f8`

全局 flag：

```asm
7117a0: adrp x21, b16000
7117a4: ldrb w0, [x21, #3616]
7117a8: cbz w0, 711878
```

如果 flag 非 0，说明第一次调用：

```asm
7117b8: stp d0, d0, [state + 8]
7117bc: stp d1, d1, [state + 24]
7117c0: str d2, [state + 40]   ; 3.0
7117c4: str d0, [out_lon_ref]
7117cc: str d1, [out_lat_ref]
7117dc: strb wzr, [flag]
```

随后输出除以 `10000000.0` 后返回成功。

伪代码：

```cpp
if (g_encrypt_first_run) {
    g_encrypt_state.lon_prev0 = raw_lon_scaled;
    g_encrypt_state.lon_prev1 = raw_lon_scaled;
    g_encrypt_state.lat_prev0 = raw_lat_scaled;
    g_encrypt_state.lat_prev1 = raw_lat_scaled;
    g_encrypt_state.counter = 3.0;

    *out_lon = raw_lon_scaled / 10000000.0;
    *out_lat = raw_lat_scaled / 10000000.0;
    g_encrypt_first_run = 0;
    return true;
}
```

注意：这里写输出时先写的是整数化后的 double，再除以 `10000000.0`。

### 3.6 后续调用：状态检查 `JudgeSD`

不是第一次调用时：

```asm
711878: ldr w1, [sp, #132]
711880: str w1, [state_time]
711884: bl JudgeSD
711888: cmn w0, #1
71188c: b.eq 7117fc
```

`JudgeSD` 返回 `-1` 则走错误返回；否则进入坐标偏移计算。

### 3.7 小数分桶/区域内插：`0x711890..0x711970`

这一段分别处理 `quantized_lon` 和 `quantized_lat`，核心模式是：

```asm
* 100000.0
* 1000000.0
取整数
取小数差值
乘以 1e-5 或 1e-6
```

对应一个分段/网格化处理逻辑。最终形成：

```text
d11 = lon_after_grid
d9  = lat_after_grid
```

这里不要急着给最终名字，建议本地先命名为：

```text
grid_lon
grid_lat
```

### 3.8 GCJ 类偏移核心：`0x711970..0x711a8c`

这一段出现非常典型的坐标转换常量和公式：

```asm
711970: mov ... 105.0
711980: fmov d10, 105.0
711984: fmov d12, 35.0
711988: fsub d10, d11, d10
71198c: fsub d12, d9, d12
711998: bl EncrpytLonLatA
7119a8: bl EncrpytLonLatB
7119b8: bl Elev_Inter
7119e0: bl encrpytTL
711a08: bl cos@plt
```

常量说明：

| 常量 | 说明 |
| --- | --- |
| `105.0` | GCJ 类公式常见经度中心偏移 |
| `35.0` | GCJ 类公式常见纬度中心偏移 |
| `0.017453292519943299` | `pi / 180` |
| `0.00669342` | 椭球偏心率平方 |
| `6378245` | Krasovsky 椭球长半轴 |
| `180.0` | 角度换算 |

核心结果：

```asm
711a58: fcvtzu w19, d8     ; 输出 lon 的整数编码
...
711a84: fcvtzu w0, d9      ; 输出 lat 的整数编码
711a8c: b 7117c4
```

随后复用首次调用分支中的输出写入逻辑：

```asm
7117c4: str d0, [out_lon_ref]
...
7117e4: fdiv d1, d1, 10000000.0
7117f0: fdiv d0, d1, 10000000.0
```

## 4. 当前最清晰的代码整理

如果只想看整理后的代码，优先看：

```text
doencrypt_annotated_pseudocode.cpp
```

这份文件已经把 `doEncrypt` 整理为一份带注释的 C/C++ 风格伪代码，并明确标注：

- 哪些名字是二进制符号中已有的；
- 哪些全局变量名是根据地址和用途推测的；
- 哪些 helper 是为了阅读从内联汇编中抽出来的；
- 哪些常量已经从 `.rodata` 或立即数确认。

## 5. 接近 C 的伪代码

下面是便于你本地对照的伪代码，变量名是教学命名，不是最终源码名：

```cpp
bool doEncrypt(long timestamp_raw,
               const double& in_lon,
               const double& in_lat,
               const double& in_extra,
               double& out_lon,
               double& out_lat) {
    TimeParts tm = gmtime(timestamp_raw / 1000);
    int gps_a = 0;
    int gps_b = 0;
    UTC2GPS(tm.year, tm.month, tm.day, tm.hour, tm.min, tm.sec, gps_a, gps_b);

    if (!check_time_and_extra(gps_a, (int)in_extra)) {
        log("wgtochina_lb input parameter error");
        return false;
    }

    double raw_lon_scaled = quantize_to_1e7(in_lon);
    double quantized_lon = raw_lon_scaled / 10000000.0;
    if (quantized_lon < 115.73278 || quantized_lon > 117.85876) {
        log("wgtochina_lb input parameter error");
        return false;
    }

    double raw_lat_scaled = quantize_to_1e7(in_lat);
    double quantized_lat = raw_lat_scaled / 10000000.0;
    if (quantized_lat < 38.51527 || quantized_lat > 40.41024) {
        log("wgtochina_lb input parameter error");
        return false;
    }

    if (g_encrypt_first_run) {
        init_encrypt_state(raw_lon_scaled, raw_lat_scaled);
        out_lon = raw_lon_scaled / 10000000.0;
        out_lat = raw_lat_scaled / 10000000.0;
        g_encrypt_first_run = false;
        return true;
    }

    g_encrypt_state.time_value = gps_b;
    if (JudgeSD() == -1) {
        log("wgtochina_lb input parameter error");
        return false;
    }

    double grid_lon = grid_adjust_lon(quantized_lon);
    double grid_lat = grid_adjust_lat(quantized_lat);

    double x = grid_lon - 105.0;
    double y = grid_lat - 35.0;
    double delta_a = EncrpytLonLatA(x, y);
    double delta_b = EncrpytLonLatB(x, y);
    double elev = Elev_Inter(grid_lon, grid_lat);

    delta_a += elev * k_elev_factor;
    delta_b += elev * k_elev_factor;

    double rad_lat = grid_lat * (pi / 180.0);
    double magic = 1.0 - 0.00669342 * encrpytTL(rad_lat);
    double sqrt_magic = sqrt(magic);

    double out_lon_scaled =
        (grid_lon + delta_a * 180.0 / ((6378245.0 / sqrt_magic) * cos(rad_lat) * pi))
        * 10000000.0;

    double out_lat_scaled =
        (grid_lat + delta_b * 180.0 * magic * sqrt_magic / 19903725.9)
        * 10000000.0;

    out_lon = trunc_unsigned(out_lon_scaled) / 10000000.0;
    out_lat = trunc_unsigned(out_lat_scaled) / 10000000.0;
    return true;
}
```

需要注意：

- 上面 `check_time_and_extra`、`grid_adjust_lon`、`grid_adjust_lat` 是为了教学拆出来的名字；
- 真实二进制里这些逻辑大多直接写在 `doEncrypt` 内部；
- `k_elev_factor` 来自 `0x9ae000 + 2272`，本次还没有给它最终语义；
- `quantize_to_1e7` 的实现需要仔细处理 `fcvtzu ..., #10`，不要简单等同于 `round(x * 1e7)`。

## 6. 本地反编译器操作建议

在 Ghidra/IDA 中只针对 `doEncrypt` 先做这些动作：

1. 把函数返回类型设为 `bool` 或 `int`。
2. 设置参数：
   ```cpp
   int doEncrypt(long timestamp_raw,
                 const double* in_lon,
                 const double* in_lat,
                 const double* in_extra,
                 double* out_lon,
                 double* out_lat)
   ```
   如果工具支持引用显示，再改成 C++ reference。
3. 给保存寄存器命名：
   - `x23 = in_lon_ref`
   - `x21 = in_lat_ref`
   - `x25 = in_extra_ref`
   - `x22 = out_lon_ref`
   - `x24 = out_lat_ref`
4. 把 `0x7117fc` 命名成 `return_false_log_input_error`。
5. 把 `0x7117a0` 的 byte 命名成 `g_encrypt_first_run`。
6. 把 `0xb27000 + 0x8a8` 命名成 `g_encrypt_state`。
7. 先不要把 `in_lon/in_lat` 定死；如果你在本地有调用点或样例输入，再确认经纬顺序。

