# 专注函数：`wgtochina_lb`

本文只看用户指定的函数：

```cpp
unsigned int wgtochina_lb(int wg_flag,
                          unsigned int wg_lng,
                          unsigned int wg_lat,
                          int wg_heit,
                          int wg_week,
                          unsigned int wg_time,
                          unsigned int *china_lng,
                          unsigned int *china_lat)
```

## 1. 定位结果

符号表中可以直接找到该函数：

```text
0000000000710e60 T wgtochina_lb
```

完整反汇编窗口：

```text
25_wgtochina_lb_disassembly.asm
```

注释版伪代码：

```text
wgtochina_lb_annotated_pseudocode.cpp
```

`.rodata` 中恢复到源码路径：

```text
/home/a/mapenv/encryption-map/src/gnss_encrypt.cpp
```

注意：二进制没有保留源码注释；当前注释是根据符号、字符串、常量、寄存器参数和控制流转换出来的。

## 2. ARM64 参数映射

AAPCS64 下前 8 个整数/指针参数走 `x0..x7`：

| 参数 | 寄存器 | 用途 |
| --- | --- | --- |
| `wg_flag` | `w0` | 0 走初始化路径；非 0 走实际转换路径 |
| `wg_lng` | `w1` | 输入经度，整数编码，单位为度 * 1e7 |
| `wg_lat` | `w2` | 输入纬度，整数编码，单位为度 * 1e7 |
| `wg_heit` | `w3` | 高度/海拔类参数，要求 `<= 5000` |
| `wg_week` | `w4` | GPS week 类参数，要求在 `[2412, 2440]` |
| `wg_time` | `w5` | 时间类参数，写入全局状态后供 `JudgeSD()` 使用 |
| `china_lng` | `x6` / 保存到 `x19` | 输出经度指针 |
| `china_lat` | `x7` / 保存到 `x20` | 输出纬度指针 |

开头保存输出指针：

```asm
710e70: stp x19, x20, [sp, #16]
710e74: mov x19, x6
710e78: mov x20, x7
```

## 3. 返回值

| 返回值 | 含义 |
| --- | --- |
| `0` | 成功 |
| `0xffff95ff` | 输入/状态错误；按有符号解释为 `-27137` |

错误路径：

```asm
710f24: str wzr, [x19]     ; *china_lng = 0
710f28: mov w0, #0xffff95ff
710f2c: str wzr, [x20]     ; *china_lat = 0
710f38: ret
```

## 4. 算法逻辑

### 4.1 参数范围检查

第一段检查 `wg_week` 和 `wg_heit`：

```asm
710e64: sub w4, w4, #0x96c
710e68: cmp w4, #0x1c
710e7c: b.hi error
710e80: mov w4, #0x1388
710e84: cmp w3, w4
710e88: b.gt error
```

对应：

```cpp
if ((unsigned int)(wg_week - 2412) > 28U) error;
if (wg_heit > 5000) error;
```

### 4.2 坐标粗范围检查

输入经纬度都是整数编码，先除以 `10000000.0`：

```cpp
lng = wg_lng / 10000000.0;
lat = wg_lat / 10000000.0;
```

粗范围常量：

```text
lng: [72.004, 137.8347]
lat: [0.8293, 55.8271]
```

这是一层中国范围级别过滤。

### 4.3 初始化路径

如果 `wg_flag == 0`：

```asm
710eec: cbnz w0, 710f3c
...
710f00: stp d0, d0, [state + 8]
710f04: stp d1, d1, [state + 24]
710f08: str d2, [state + 40]  ; 3.0
710f0c: str w1, [x6]
710f10: str w2, [x7]
```

对应：

```cpp
state.lng0 = wg_lng;
state.lng1 = wg_lng;
state.lat0 = wg_lat;
state.lat1 = wg_lat;
state.counter = 3.0;
*china_lng = wg_lng;
*china_lat = wg_lat;
return 0;
```

### 4.4 非初始化路径：状态检查

如果 `wg_flag != 0`：

```asm
710f40: str w5, [state + 0]
710f44: bl JudgeSD
710f48: cmn w0, #1
710f4c: b.eq error
```

也就是：

```cpp
state.current_time = wg_time;
if (JudgeSD() == -1) error;
```

### 4.5 小数网格调整

函数对经度和纬度分别做相同的十进制分桶处理：

```cpp
grid_lng = grid_adjust(lng);
grid_lat = grid_adjust(lat);
```

核心常量：

```text
100000.0
1000000.0
0.1
1e-5
1e-6
```

可读逻辑见 `wgtochina_lb_annotated_pseudocode.cpp` 的 `grid_adjust()`。

### 4.6 GCJ 类偏移计算

核心偏移从这几个函数得到：

```cpp
x = grid_lng - 105.0;
y = grid_lat - 35.0;

delta_lng = EncrpytLonLatA(x, y);
delta_lat = EncrpytLonLatB(x, y);
elevation = Elev_Inter(grid_lng, grid_lat);

delta_lng += elevation * 0.001;
delta_lat += elevation * 0.001;
```

关键常量：

| 常量 | 含义 |
| --- | --- |
| `105.0` | GCJ 类公式经度中心偏移 |
| `35.0` | GCJ 类公式纬度中心偏移 |
| `0.001` | 高程/插值修正因子 |
| `pi / 180` | 角度转弧度 |
| `0.00669342` | 椭球偏心率平方 |
| `6378245.0` | Krasovsky 椭球长半轴 |
| `19903725.9` | 纬度方向公式分母 |

### 4.7 输出转换

最终计算：

```cpp
rad_lat = grid_lat * pi / 180;
sin_like = encrpytTL(rad_lat);
magic = 1.0 - 0.00669342 * sin_like * sin_like;
sqrt_magic = sqrt(magic);

transformed_lng =
    grid_lng +
    delta_lng * 180.0 /
    ((6378245.0 / sqrt_magic) * cos(rad_lat) * pi);

transformed_lat =
    grid_lat +
    delta_lat * 180.0 * magic * sqrt_magic / 19903725.9;

*china_lng = (unsigned int)(transformed_lng * 10000000.0);
*china_lat = (unsigned int)(transformed_lat * 10000000.0);
return 0;
```

## 5. 最终代码

最终整理版代码见：

```text
wgtochina_lb_annotated_pseudocode.cpp
```

它保留了用户指定的函数签名，并把能解析出来的注释都转换到了代码内。
