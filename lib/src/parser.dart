import 'package:flutter/services.dart';
import 'package:flutter_mcap_parser/src/rust/frb_generated.dart';
import 'package:flutter_mcap_parser/src/rust/api/parser.dart';

typedef OnMessage = void Function(McapMessage message);
typedef OnMetadata = void Function(McapMetadataInfo metadata);
typedef OnChannel = void Function(McapChannelInfo channel);
typedef OnSchema = void Function(McapSchemaInfo schema);
typedef OnAttachment = void Function(McapAttachmentInfo attachment);
typedef OnEnd = void Function();
typedef OnError = void Function(String err);

class McapParser {
  static Future init() async => await RustLib.init();

  static void parseFromPath(
    String path, {
    OnMessage? onMessage,
    OnMetadata? onMetadata,
    OnChannel? onChannel,
    OnSchema? onSchema,
    OnAttachment? onAttachment,
    OnError? onError,
    required OnEnd onEnd,
  }) => _parse(
    path,
    Uint8List(0),
    onMessage: onMessage,
    onMetadata: onMetadata,
    onChannel: onChannel,
    onSchema: onSchema,
    onAttachment: onAttachment,
    onError: onError,
    onEnd: onEnd,
  );

  static void parseFromBytes(
    Uint8List bytes, {
    OnMessage? onMessage,
    OnMetadata? onMetadata,
    OnChannel? onChannel,
    OnSchema? onSchema,
    OnAttachment? onAttachment,
    OnError? onError,
    required OnEnd onEnd,
  }) => _parse(
    '',
    bytes,
    onMessage: onMessage,
    onMetadata: onMetadata,
    onChannel: onChannel,
    onSchema: onSchema,
    onAttachment: onAttachment,
    onError: onError,
    onEnd: onEnd,
  );

  static void parseFromAssets(
    String assetsKey, {
    OnMessage? onMessage,
    OnMetadata? onMetadata,
    OnChannel? onChannel,
    OnSchema? onSchema,
    OnAttachment? onAttachment,
    OnError? onError,
    required OnEnd onEnd,
  }) {
    rootBundle.load(assetsKey).then(
      (data) {
        _parse(
          '',
          data.buffer.asUint8List(),
          onMessage: onMessage,
          onMetadata: onMetadata,
          onChannel: onChannel,
          onSchema: onSchema,
          onAttachment: onAttachment,
          onError: onError,
          onEnd: onEnd,
        );
      },
    );
  }

  static void _parse(
    String path,
    Uint8List data, {
    OnMessage? onMessage,
    OnMetadata? onMetadata,
    OnChannel? onChannel,
    OnSchema? onSchema,
    OnAttachment? onAttachment,
    OnError? onError,
    required OnEnd onEnd,
  }) {
    parseMcap(
      path: path,
      buf: data,
      types: [
        if (onMetadata != null) RecordType.metadata,
        if (onChannel != null) RecordType.channel,
        if (onSchema != null) RecordType.schema,
        if (onAttachment != null) RecordType.attachment,
        if (onMessage != null) RecordType.message,
      ],
    ).listen((event) {
      event.when(
        schema: (schema) {
          onSchema?.call(schema);
        },
        channel: (channel) {
          onChannel?.call(channel);
        },
        metadata: (metadata) {
          onMetadata?.call(metadata);
        },
        attachment: (attachment) {
          onAttachment?.call(attachment);
        },
        message: (message) {
          onMessage?.call(message);
        },
        end: () {
          onEnd.call();
        },
        error: (err) {
          (onError ?? print).call(err);
        },
      );
    });
  }
}
