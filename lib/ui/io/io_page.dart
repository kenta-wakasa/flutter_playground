import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'io_controller.dart';

class IoPage extends ConsumerWidget {
  const IoPage({Key key}) : super(key: key);

  /// どのインスタンスであっても不変な値を static として宣言する
  static const String title = '外部データの入出力';
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _ioProvider = watch(ioProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text('アプリのローカルパス: \n${_ioProvider?.appPath}'),
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                  height: 25,
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: Text(
                      _ioProvider.content,
                    ),
                  )),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  await _ioProvider.write();
                  await _ioProvider.read();
                },
                child: const Text('いまの時間を書き込む'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
