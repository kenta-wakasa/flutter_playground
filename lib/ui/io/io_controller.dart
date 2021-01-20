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
      path = await localPath;
      appDirectory = Directory('$path/playground/');
      if (appDirectory.existsSync()) {
        print('${appDirectory.path} already exist');
      } else {
        await appDirectory.create(recursive: true);
      }
      path = appDirectory.path;
    }();
  }

  /// このプロバイダーが廃棄されるよきに呼ばれる
  @override
  void dispose() {
    super.dispose();
  }

  String path;
  Directory appDirectory;

  /// ローカルパスの取得
  Future<String> get localPath async {
    final directory = await getApplicationDocumentsDirectory();
    notifyListeners();
    return directory.path;
  }

  /// 現在時刻の書き込み
  void write() {
    final file = File('$path/test.txt');
    print('write: ${file.path}');
    file.writeAsStringSync(DateTime.now().toString());
    notifyListeners();
  }

  String get read {
    final file = File('$path/test.txt');
    return file.readAsStringSync();
  }
}
