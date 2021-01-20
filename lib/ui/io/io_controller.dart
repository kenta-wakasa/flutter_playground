import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

final ioProvider = ChangeNotifierProvider.autoDispose<IoController>(
  (ref) => IoController(),
);

class IoController extends ChangeNotifier {
  IoController() {
    /// 初期化処理をここに書く
    () async {
      final _localPath = await localPath;
      appPath = '$_localPath/playground/';
      appDirectory = Directory(appPath);
      appPath = appDirectory.path;
      // ignore: avoid_slow_async_io
      if (await appDirectory.exists()) {
        print('${appDirectory.path} already exist');
        await read();
      } else {
        await appDirectory.create(recursive: true);
        content = 'ファイルに書き込まれた時間を表示します';
      }
    }();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String appPath;
  String content;
  Directory appDirectory;

  /// ローカルパスの取得
  Future<String> get localPath async {
    final directory = await getApplicationDocumentsDirectory();
    notifyListeners();
    return directory.path;
  }

  /// 現在時刻の書き込み
  Future<void> write() async {
    final file = File('$appPath/test.txt');
    print('write: ${file.path}');
    await file.writeAsString(DateTime.now().toString());
  }

  /// 現在時刻の読み込み
  Future<void> read() async {
    final file = File('$appPath/test.txt');
    content = await file.readAsString();
    notifyListeners();
  }
}
