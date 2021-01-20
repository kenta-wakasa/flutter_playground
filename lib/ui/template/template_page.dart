import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'template_controller.dart';

class TemplatePage extends ConsumerWidget {
  const TemplatePage({Key key}) : super(key: key);

  /// どのインスタンスであっても不変な値を static として宣言する
  static const String title = 'テンプレート';
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _templateProvider = watch(templateProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
