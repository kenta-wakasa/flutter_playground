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
            Text('アプリのローカルパス: \n${_ioProvider?.path}'),
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Text(
                      _ioProvider.read,
                    ),
                  )),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _ioProvider.write();
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
