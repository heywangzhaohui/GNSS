# 第二阶段：`doEncrypt` / 坐标加密逻辑跟读

本文接续 `README.md` 的第一阶段静态识别，专门讲 `mapenv_02changsha.bin` 中坐标/地图加密相关代码的跟读方法。

本阶段目标不是一次性还原完整源码，而是教你如何从 ARM64 反汇编中逐步恢复：

1. 函数参数如何传递；
2. 经纬度如何被量化；
3. 哪些分支是范围校验；
4. 哪些常量说明它接近 WGS84/GCJ02 类坐标偏移算法；
5. 本地在 Ghidra/IDA 中下一步该如何命名。

## 1. 先确认函数签名

未 strip 的符号表给出了完整 C++ 符号：

```text
doEncrypt(long, double const&, double const&, double const&, double&, double&)
```

地址：

```text
0x711660
```

ARM64 AAPCS64 调用约定下，前几个整型/指针参数走 `x0..x7`。因此该函数进入时大致是：

| 寄存器 | 含义推测 |
| --- | --- |
| `x0` | `long` 时间戳或时间相关值 |
| `x1` | `const double&`，输入经度或 x |
| `x2` | `const double&`，输入纬度或 y |
| `x3` | `const double&`，输入高度/速度/额外量 |
| `x4` | `double&`，输出经度或 x |
| `x5` | `double&`，输出纬度或 y |

函数开头把这些寄存器保存到 callee-saved 寄存器：

```asm
mov x21, x2
mov x22, x4
mov x23, x1
mov x24, x5
mov x25, x3
```

所以后续读代码时可以按：

```text
x23 = input_0
x21 = input_1
x25 = input_2
x22 = output_0
x24 = output_1
```

## 2. 时间参数先转 GPS 周/秒

`doEncrypt` 开头对 `x0` 做了一个“魔数除法”，随后调用 `gmtime` 和 `UTC2GPS`：

```asm
7116d8: bl gmtime@plt
...
7116f8: bl UTC2GPS(int, int, int, int, int, int, int&, int&)
```

这里说明 `long` 参数很可能是 Unix 时间戳或毫秒/微秒时间戳。`UTC2GPS` 会写出两个整数，后面 `doEncrypt` 和 `wgtochina_lb` 都会读取这些时间派生值。

本地跟读建议：

- 在 Ghidra 中把第一个参数暂命名为 `timestamp`；
- 把 `sp+0x80`、`sp+0x84` 一类局部变量暂命名为 `gps_week_or_day`、`gps_seconds`；
- 暂时不要急着定最终语义，先根据交叉引用继续验证。

## 3. 输入经纬度的量化方式

`doEncrypt` 对输入 double 做了明显的缩放和整数化：

```asm
ldr d0, [x23]
...
fmul d0, d0, d3
fmul d0, d0, d3
fcvtzu w0, d0, #10
ucvtf d0, w0
fdiv d8, d0, 10000000.0
```

这里有两个重点：

1. `fcvtzu w0, d0, #10` 是“浮点转无符号整数，并带固定点缩放”的指令；
2. 后续除以 `10000000.0`，说明输入经纬度被规范到 1e-7 度级别。

`22_encrypt_constants_decoded.txt` 中也解码出了：

```text
10000000.0
```

这类 1e7 缩放非常常见于经纬度整数编码。

## 4. 范围检查

`doEncrypt` 对第三个输入和经纬度都做了范围判断，失败则进入错误日志分支：

```asm
71170c: sub w1, w1, #0x96c
711710: cmp w1, #0x1c
711714: ccmp w0, #0x1388, #0x0, ls
711718: b.gt 7117fc
...
711750: fcmpe d8, lower_lon
711754: b.mi 7117fc
711760: fcmpe d8, upper_lon
711764: b.gt 7117fc
...
711788: fcmpe d10, lower_lat
71178c: b.mi 7117fc
711798: fcmpe d10, upper_lat
71179c: b.gt 7117fc
```

失败分支会打日志并返回 `0`：

```asm
7117fc: ... LogMessage(...)
711834: mov w0, #0
```

成功分支最终返回 `1`：

```asm
7117e0: mov w0, #1
```

`22_encrypt_constants_decoded.txt` 中与范围相关的常量包括：

```text
72.004
137.8347
0.8293
55.8271
115.73278
117.85876
38.51527
40.41024
```

前四个很像“中国境内经纬度范围”的粗过滤；后四个更像某个局部地图区域边界。当前样本名为 Changsha，但常量自身更像另一个地理范围，因此这里先标记为“局部区域范围”，不要过早认定为城市边界。

## 5. 第一次调用的初始化分支

`doEncrypt` 检查一个全局 byte：

```asm
adrp x21, b16000
ldrb w0, [x21, #3616]
cbz w0, 711878
```

如果这个 byte 非 0，会直接初始化全局状态并把量化后的经纬度写到输出：

```asm
stp d0, d0, [global_state + 8]
stp d1, d1, [global_state + 24]
str d2, [global_state + 40]   ; 3.0
str d0, [x22]
str d1, [x24]
strb wzr, [x21, #3616]        ; 清零 first-run flag
mov w0, #1
```

教学意义：

- 这是典型“第一次调用先建立状态”的模式；
- `b16000 + 0xe20` 附近的 byte 可以在 Ghidra 里命名成 `g_encrypt_first_run`；
- `b27000 + 0x8a8` 一段可以命名成 `g_encrypt_state`。

## 6. 后续调用路径

第一次之后会走：

```asm
711878: ... 
711884: bl JudgeSD
711888: cmn w0, #1
71188c: b.eq error_return
```

`JudgeSD` 会基于历史状态和当前时间/距离判断是否异常，失败返回 `-1`。通过后进入主计算路径。

主计算路径调用/内联了这些典型组件：

| 函数 | 地址 | 作用推测 |
| --- | --- | --- |
| `Elev_Inter` | `0x710530` | 根据经纬度做格网/高程插值 |
| `encrpytTL` | `0x710730` | 角度归一化和三角级数近似 |
| `EncrpytLonLatA` | `0x710860` | 经度/纬度偏移量公式的一部分 |
| `EncrpytLonLatB` | `0x7109d0` | 经度/纬度偏移量公式的另一部分 |
| `EncryptHX` | `0x710b88` | 经向偏移缩放 |
| `EncryptHY` | `0x710c20` | 纬向偏移缩放 |
| `EncryptRn` | `0x710dd8` | 基于整数输入生成扰动量 |
| `wgtochina_lb` | `0x710e60` | WGS 到 China/局部坐标转换主过程 |

## 7. 常量说明

`22_encrypt_constants_decoded.txt` 中几个最关键的常量：

| 常量 | 含义 |
| --- | --- |
| `3.1415926535897931` | pi |
| `0.017453292519943299` | pi / 180，角度转弧度 |
| `0.0066934200000000003` | 常见地球椭球偏心率平方参数 |
| `6378245` | 常见 Krasovsky 椭球长半轴 |
| `10000000` | 经纬度 1e-7 度量化 |
| `105.0` / `35.0` | GCJ 类公式中常见中心偏移 |

这些常量强烈说明：这里不是简单加密壳，而是“坐标转换 + 扰动/偏移 + 状态约束”的地图加密逻辑。

## 8. 建议的本地 Ghidra/IDA 命名

先不要大规模重命名，建议只做一层“稳定命名”：

```text
doEncrypt.timestamp
doEncrypt.input_lon_or_x
doEncrypt.input_lat_or_y
doEncrypt.input_extra
doEncrypt.output_lon_or_x
doEncrypt.output_lat_or_y

g_encrypt_first_run
g_encrypt_state

quantized_lon
quantized_lat
gps_week_or_day
gps_seconds
```

然后沿着这些函数继续补类型：

```text
UTC2GPS
JudgeSD
wgtochina_lb
Elev_Inter
EncrpytLonLatA
EncrpytLonLatB
```

## 9. 下一步建议

下一阶段可以做两件事之一：

1. **继续静态还原**：把 `doEncrypt` 和 `wgtochina_lb` 转成接近 C 的伪代码，逐行标注输入/输出；
2. **做动态验证准备**：找运行依赖、启动参数和样例输入，在 ARM64 环境或 qemu-user 下观察 `doEncrypt` 的输入输出。

如果你本地同步做 Ghidra，建议先从 `doEncrypt` 入口开始，按本文的寄存器映射给参数命名，再看反编译器输出会清晰很多。
