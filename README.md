# flutter_mcap_parser

一个高性能的 Flutter MCAP 文件解析库。底层基于 Rust 开发，通过 `flutter_rust_bridge` 连接，专为处理机器人日志数据（如 ROS 2 / Foxglove）设计。

## ✨ 特性

* **🚀 高性能**：核心解析逻辑由 Rust 编写，通过 FFI 调用，解析速度极快且内存安全。
* **🛠️ 全面支持**：支持读取 Schema, Channel, Message, Metadata, Attachment 等所有 MCAP 核心记录。
* **📂 多种输入源**：支持从 **文件路径**、**内存二进制 (Uint8List)** 或 **Flutter Assets** 读取。
* **⚡️ 按需解析**：智能优化策略。只有当你传入了对应的回调函数时（例如 `onMessage`），底层才会去解析该类型的数据，最大化提升性能。
* **🌊 流式处理**：基于 Dart Stream 和 Rust StreamSink，不会阻塞 UI 线程。

## 📦 安装

1. 在 `pubspec.yaml` 中添加依赖：

```yaml
dependencies:
  flutter_mcap_parser: ^0.1.0 # 请替换为实际版本
```

2. 确保你的 Flutter 环境已经配置好 Rust 编译环境（如果你是从源码编译）。

## 🚀 快速开始

### 1. 初始化

在使用任何解析功能之前，**必须**先调用初始化方法。通常建议在 `main()` 函数中完成。

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 初始化底层 Rust 库
  await McapParser.init();

  runApp(const MyApp());
}
```

### 2. 读取本地文件

这是最常用的方式，适用于处理存储设备上的大文件。

```dart
import 'package:flutter_mcap_parser/flutter_mcap_parser.dart';

void parseFile() {
  McapParser.parseFromPath(
    "/sdcard/logs/robot_data.mcap",
    // 监听 Channel 信息
    onChannel: (channel) {
      print("发现话题: ${channel.topic} (SchemaID: ${channel.schemaId})");
    },
    // 监听 Schema 定义
    onSchema: (schema) {
      print("发现数据定义: ${schema.name} (${schema.encoding})");
    },
    // 监听具体消息
    onMessage: (message) {
      print("收到消息: 话题ID=${message.channelId}, 时间=${message.publishTime}");
      // message.data 是 Uint8List，需要根据 schema 解码
    },
    // 错误处理
    onError: (err) => print("解析出错: $err"),
    // [必填] 解析结束回调
    onEnd: () {
      print("✅ 文件解析完成");
    },
  );
}
```

### 3. 读取 Flutter Assets

适用于读取打包在 App 内的示例数据或配置文件。

```dart
void parseAsset() {
  McapParser.parseFromAssets(
    "assets/sample.mcap",
    onMetadata: (meta) {
      print("元数据: ${meta.metadata}");
    },
    onEnd: () => print("Assets 解析结束"),
  );
}
```

### 4. 读取内存数据 (Bytes)

适用于网络下载或通过其他方式获取到的二进制流。

```dart
void parseBytes(Uint8List mcapData) {
  McapParser.parseFromBytes(
    mcapData,
    onMessage: (msg) {
      // 处理消息...
    },
    onEnd: () => print("内存数据解析结束"),
  );
}
```

## 📖 API 参考

### `McapParser`

#### `static Future init()`

初始化 FFI 绑定。必须在使用前调用一次。

#### 解析方法

所有解析方法都支持以下命名参数（回调函数）。**注意：只有传入了非空的回调，底层才会解析对应的数据类型。**

| 参数名            | 类型                                  | 说明                      |
|:---------------|:------------------------------------|:------------------------|
| `onMessage`    | `void Function(McapMessage)`        | 每当读到一条消息记录时触发。          |
| `onChannel`    | `void Function(McapChannelInfo)`    | 每当读到话题通道定义时触发。          |
| `onSchema`     | `void Function(McapSchemaInfo)`     | 每当读到数据格式定义时触发。          |
| `onMetadata`   | `void Function(McapMetadataInfo)`   | 每当读到用户元数据时触发。           |
| `onAttachment` | `void Function(McapAttachmentInfo)` | 每当读到附件文件时触发。            |
| `onError`      | `void Function(String)`             | 当底层发生错误（如文件损坏、解压失败）时触发。 |
| `onEnd`        | `void Function()`                   | **(必填)** 当文件读取流正常结束时触发。 |

#### 方法签名

1. **`parseFromPath(String path, { ... })`**
    * 直接在 Rust 层打开文件，性能最高，内存占用最低。推荐用于大文件。

2. **`parseFromAssets(String assetsKey, { ... })`**
    * 使用 `rootBundle` 加载 Asset 并转换为 Uint8List 传给底层。

3. **`parseFromBytes(Uint8List bytes, { ... })`**
    * 直接解析内存中的二进制数据。

## ⚠️ 注意事项

1. **性能优化提示**：如果你只关心话题列表（Channel），请不要传入 `onMessage` 回调。这样解析器会直接跳过所有消息数据块（Chunk），解析速度会提升 100 倍以上。
2. **主线程阻塞**：虽然解析是在 Rust 线程池或异步流中进行的，但在回调极其频繁的情况下（如每秒 10 万条消息），Dart 端的 `onMessage` 执行可能会占用较多 UI
   线程资源。建议在回调中进行轻量级处理。

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

## 📄 License

MIT