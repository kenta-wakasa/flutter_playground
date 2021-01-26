import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as path;

import '../../utils/app.dart';

final ioProvider = ChangeNotifierProvider.autoDispose<IoController>(
  (ref) => IoController(),
);

class IoController extends ChangeNotifier {
  IoController() {
    () async {
      await read();
    }();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String _content = 'ファイルに書き込まれた時間を表示します';

  String get content => _content;

  /// 現在時刻の書き込み
  Future<void> write() async {
    final file = File(path.join(App.directory.path, 'time.txt'));
    await file.writeAsString(DateTime.now().toString());
  }

  /// 現在時刻の読み込み
  Future<bool> read() async {
    bool result;
    final file = File(path.join(App.directory.path, 'time.txt'));
    try {
      _content = await file.readAsString();
      result = true;
    } on FileSystemException catch (e) {
      print(e);
      print(_content);
      result = false;
    }
    notifyListeners();
    return result;
  }
}
