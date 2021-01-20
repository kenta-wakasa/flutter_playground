import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final templateProvider = ChangeNotifierProvider.autoDispose<TemplateController>(
  (ref) => TemplateController(),
);

class TemplateController extends ChangeNotifier {
  TemplateController() {
    /// 初期化処理をここに書く
  }

  /// このプロバイダーが廃棄されるよきに呼ばれる
  @override
  void dispose() {
    super.dispose();
  }

  static const String title = 'テンプレート';
}
