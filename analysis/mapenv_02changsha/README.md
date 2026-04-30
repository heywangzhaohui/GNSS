# mapenv_02changsha.bin 反汇编教学记录

本目录以云端仓库里的 `mapenv_02changsha.bin` 为例，从零开始做二进制识别、ELF 结构分析和关键函数反汇编。这里不沿用之前的任何结论；每一步都从样本本身重新验证。

## 0. 清理历史上下文，从头开始

本次处理采用下面的原则：

1. 先确认样本是否确实来自 Git，而不是假设文件已在当前工作区。
2. 先做静态识别：文件类型、哈希、架构、入口点、动态依赖、节区布局。
3. 再反汇编入口点和 `main`，最后追踪业务函数。
4. 云端只保留可复现命令和关键摘录；完整 60MB+ 反汇编文本按需本地重新生成。

## 1. 找到样本

当前工作区一开始只展开了 `README.md`，但远端 `origin/master` 的树里有目标文件：

```bash
git ls-tree -l origin/master mapenv_02changsha.bin
git checkout origin/master -- mapenv_02changsha.bin
```

样本基本指纹见 `00_identification.txt`：

- 文件：`mapenv_02changsha.bin`
- 大小：`12418490` 字节
- SHA256：`6c81ce0411dd2df2f70b51de8218433d6cbc081c6c4a54c5f4e4a6c5250b42c1`
- SHA1：`ae25ec50a8adeb05cb44233f5bee576c6ab96c1d`
- MD5：`901b0cededaa8fbb53270a90454f5847`

## 2. 识别文件格式和架构

`file` 和 `readelf -h` 的结论：

- ELF64
- Little endian
- AArch64 / ARM64
- 可执行文件，非 PIE 风格 `EXEC`
- 动态链接
- interpreter：`/lib/ld-linux-aarch64.so.1`
- 带 `debug_info`
- 未 strip，符号信息非常有用
- Entry point：`0x59cf34`

这一步决定了本地工具选择：

- Linux 云端/本地：`binutils-aarch64-linux-gnu`
- Ghidra：Language 选 `AARCH64:LE:64`
- IDA：processor 选 ARM64 / AArch64

## 3. 安装/确认反汇编工具

云端默认 `objdump` 不支持 AArch64，因此安装交叉 binutils：

```bash
sudo apt-get update
sudo apt-get install -y binutils-aarch64-linux-gnu
```

然后使用：

```bash
aarch64-linux-gnu-objdump
aarch64-linux-gnu-nm
readelf
strings
hexdump
```

## 4. ELF 结构重点

节区信息见 `03_section_headers.txt`。关键节区：

| 节区 | 虚拟地址 | 文件偏移 | 大小 | 说明 |
| --- | --- | --- | --- | --- |
| `.plt` | `0x593390` | `0x193390` | `0x1ec0` | 动态库调用跳板 |
| `.text` | `0x595250` | `0x195250` | `0x418e0c` | 主代码区 |
| `.rodata` | `0x9ae070` | `0x5ae070` | `0x5e5b3` | 字符串/常量 |
| `.debug_info` | file offset `0x712441` | - | `0x1a7334` | DWARF 调试信息 |
| `.symtab` | file offset `0x9f77a0` | - | `0x1896f0` | 完整符号表 |

动态依赖见 `04_dynamic.txt`，主要包括：

- `libGAdasSDK.so`
- `libssl.so.1.1`
- `libcrypto.so.1.1`
- `libstdc++.so.6`
- `libpthread.so.0`
- `libc.so.6`

RUNPATH 暴露了构建/运行目录：

```text
/home/a/mapenv/encryption-map/3rd_party/j2/ehp_v3/libs
/home/a/mapenv/encryption-map/3rd_party/j2/grpc_1.8.6/lib
```

## 5. 入口点到 main

入口点摘录见 `13_entrypoint_window.asm`：

```asm
000000000059cf34 <_start>:
  ...
  59cf54: movk x0, #0x59, lsl #16
  59cf58: movk x0, #0x7078
  ...
  59cf7c: bl 594ab0 <__libc_start_main@plt>
```

`_start` 把 `0x597078` 传给 `__libc_start_main`，因此：

```text
main = 0x597078
```

`main` 的完整摘录见 `14_main_disassembly.asm`。

## 6. main 的静态流程

根据 `14_main_disassembly.asm` 可读出的主流程：

1. 启动时打印字符串 `0409\n`。
2. 检查 `argc`，反汇编里是 `cmp w24, #0x4; b.le not enough agrc num!`。
3. 读取多个命令行参数：
   - `argv[1]`
   - `argv[2]`
   - `argv[3]`，通过 `strtol(..., 10)` 转整数
   - `argv[4]`
   - `argv[5]`
4. 调用 `fusnloc::utils::initLogModule(...)`。
5. 调用 `fusnloc::Settings::load(...)`。
6. 调用 `horizon::ndm::EhrConfig::LoadConfigYamlFile(...)`。
7. 注册 `SIGINT` 和 `SIGSEGV` 处理。
8. 调用 `fusnloc::FusionProc::procStart(...)`。
9. 调用 `fusnloc::DataReceiver::init(...)`。
10. 根据配置开关调用：
    - `engineInit()`
    - `ehorizonInit(...)`
11. 进入循环，直到退出标志变化后 stop：
    - `fusnloc::FusionProc::stop()`
    - `fusnloc::DataReceiver::stop()`

注意：`main` 读取到 `argv[5]`，但只检查 `argc > 4`。如果按 C/C++ 参数计数严格理解，安全条件应至少是 `argc >= 6`。这可能是一个真实的边界检查问题，也可能是外层启动脚本保证了参数数量。本地动态验证时要重点观察。

## 7. 关键业务符号

因为文件未 strip，`nm -C`/符号表非常有帮助。已确认的关键地址：

| 符号 | 地址 | 说明 |
| --- | --- | --- |
| `main` | `0x597078` | 进程主入口 |
| `engineInit()` | `0x59d818` | 地图/引擎初始化相关 |
| `ehorizonInit(std::string)` | `0x59dc08` | eHorizon 初始化 |
| `fusnloc::DataReceiver::init(char const*, char const*)` | `0x5a1698` | 数据接收初始化 |
| `fusnloc::FusionProc::procStart(std::string, char const*)` | `0x705140` | 融合流程启动 |
| `fusnloc::Settings::load(std::string)` | `0x7140f0` | 配置加载 |
| `horizon::ndm::EhrConfig::LoadConfigYamlFile(std::string const&)` | `0x727a30` | EHR YAML 配置加载 |
| `doEncrypt(long, double const&, double const&, double const&, double&, double&)` | `0x711660` | 坐标/地图加密相关入口 |
| `EncryptHX` | `0x710b88` | 加密计算子函数 |
| `EncryptHY` | `0x710c20` | 加密计算子函数 |
| `EncryptRn` | `0x710dd8` | 加密扰动/随机量子函数 |

## 8. 加密/坐标转换线索

`19_encrypt_disassembly.asm` 覆盖了 `0x710b80..0x711900`。这一段附近出现：

- `EncryptHX`
- `EncryptHY`
- `EncryptRn`
- `EncrpytIni`（原符号拼写就是 Encrpyt）
- `wgtochina_lb`
- `doEncrypt(...)`

同时符号和字符串中出现大量 WGS84、GCJ02、UTM 相关函数：

- `TransformMapFromWGS84ToUTM`
- `TransformMapFromGCJ02ToUTM`
- `TransformMapFromGCJ02ToWGS84`
- `TransformPointFromWGS84ToUTM`
- `TransformLaneLineFromGCJ02ToWGS84`

因此这份二进制不是普通压缩/壳样本，而是一个 ARM64 地图/定位服务程序，包含坐标转换、EHR/eHorizon、GNSS、protobuf、gRPC 和地图加密逻辑。

## 9. 本地同步教学流程

你本地可以按这个顺序做：

1. 拉取同一提交/分支，确认哈希一致。
2. 用 `file`/`sha256sum` 确认样本。
3. 用 `readelf -h -S -l -d` 看架构、节区、动态库。
4. 用 `aarch64-linux-gnu-objdump -d -C` 生成反汇编。
5. 先看 `_start`，确认 `main = 0x597078`。
6. 再看 `main`，画出启动流程。
7. 用 `nm -C` 搜索 `Encrypt`、`doEncrypt`、`MapEngine`、`EhrService`。
8. 在 Ghidra/IDA 中导入：
   - 架构：AArch64 little endian
   - 保留符号
   - 开启 DWARF 分析
   - 从 `main`、`doEncrypt`、`engineInit` 三个点开始命名和交叉引用

## 10. 本目录文件说明

| 文件 | 用途 |
| --- | --- |
| `00_identification.txt` | 文件类型、哈希、大小 |
| `01_elf_header.txt` | ELF 头 |
| `02_program_headers.txt` | Program headers |
| `03_section_headers.txt` | Section headers |
| `04_dynamic.txt` | 动态依赖/RUNPATH |
| `05_notes.txt` | BuildID/ABI notes |
| `09_header_hexdump_512.txt` | 文件头十六进制 |
| `10_objdump_overview.txt` | objdump 总览 |
| `13_entrypoint_window.asm` | `_start` 附近反汇编 |
| `14_main_disassembly.asm` | `main` 反汇编摘录 |
| `18_rodata_main_strings_window.txt` | `main` 附近引用的 rodata 字符串 |
| `19_encrypt_disassembly.asm` | 加密相关函数窗口 |
| `20_encrypt_helpers_disassembly.asm` | 加密辅助函数窗口 |
| `21_encrypt_constants_rodata.txt` | 加密常量 rodata 原始 dump |
| `22_encrypt_constants_decoded.txt` | 加密常量十进制解码 |
| `02_encrypt_walkthrough.md` | 第二阶段 `doEncrypt` 跟读教程 |
| `reproduce_cloud_steps.sh` | 复现命令脚本 |

完整反汇编可按需生成：

```bash
aarch64-linux-gnu-objdump -d -C --no-show-raw-insn mapenv_02changsha.bin \
  > analysis/mapenv_02changsha/full_disassembly_text.asm
```

该文件约 60MB，建议本地生成、本地查看，不建议提交。
