import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'template_controller.dart';

final templateProvider = ChangeNotifierProvider.autoDispose<TemplateController>(
  (ref) => TemplateController(),
);

class TemplatePage extends ConsumerWidget {
  const TemplatePage({Key key}) : super(key: key);

  static const String title = 'テンプレート';
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _provider = watch(templateProvider);
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
