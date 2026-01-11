import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mcap_parser/flutter_mcap_parser.dart';

Future<void> main() async {
  await McapParser.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('flutter_rust_bridge quickstart')),
        body: McapParserTest(),
      ),
    );
  }
}

class McapParserTest extends StatefulWidget {
  const McapParserTest({super.key});

  @override
  State<McapParserTest> createState() => _McapParserTestState();
}

class _McapParserTestState extends State<McapParserTest> {
  List<McapSchemaInfo> schemas = [];
  List<McapMessage> messages = [];

  @override
  void initState() {
    super.initState();
    McapParser.parseFromPath(
      '/home/debuggerx/Desktop/test.mcap',
      onSchema: (schema) {
        if (mounted) {
          setState(() {
            schemas.add(schema);
          });
        }
      },
      onMessage: (message) {
        if (mounted) {
          setState(() {
            messages.add(message);
          });
        }
      },
      onEnd: () {
        print('onEnd');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...schemas.map((schema) => Text('[Schema] name: ${schema.name}, encoding: ${schema.encoding}, data: ${utf8.decode(schema.data)}')),
        ...messages.indexed.map((entry) {
          var (index, message) = entry;
          return Text('[Message$index] log_time: ${message.logTime.toLocal()} data: ${utf8.decode(message.data)}');
        }),
      ],
    );
  }
}
