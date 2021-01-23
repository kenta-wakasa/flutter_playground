import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final clearButtonProvider =
    ChangeNotifierProvider.autoDispose<ClearButtonController>(
  (ref) => ClearButtonController(),
);

class ClearButtonController extends ChangeNotifier {
  ClearButtonController() {
    /// 初期化処理をここに書く
    count = 0;
  }

  /// このプロバイダーが廃棄されるよきに呼ばれる
  @override
  void dispose() {
    super.dispose();
  }

  int count;
  void increment() {
    count++;
    notifyListeners();
  }
}
