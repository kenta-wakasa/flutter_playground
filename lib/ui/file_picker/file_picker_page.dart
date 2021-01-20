import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'file_picker_controller.dart';

class FilePickerPage extends ConsumerWidget {
  const FilePickerPage({Key key}) : super(key: key);
  static const String title = 'ファイルピッカー';

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _provider = watch(filePickerProvider);
    const textStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 360,
              height: 200,
              child: Center(
                  child: Text(
                _provider.fileName,
                style: textStyle,
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () async {
                  if (await _provider.pickFileIsSuccess) {
                    const snackBar = SnackBar(content: Text('ピックしたよ！'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    const snackBar = SnackBar(content: Text('ピックしなかったよ！'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: const Text('ファイルを選択する'),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(16),
              height: 2,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(
              width: 300,
              height: 200,
              // child: ListView(
              //   children: [
              //     Center(child: Text(_provider.fileContents)),
              //   ],
              // ),
              child: SingleChildScrollView(
                child: Center(child: Text(_provider.fileContents)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: _provider.pickSuccess
                    ? () async {
                        _provider.readFileContents();
                      }
                    : null, // 使えない時は null をいれると色が変わってくれる
                child: const Text('選択したファイルを読み込む'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
