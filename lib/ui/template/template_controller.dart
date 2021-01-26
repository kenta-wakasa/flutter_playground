import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final templateProvider = ChangeNotifierProvider.autoDispose<TemplateController>(
  (ref) => TemplateController(),
);

class TemplateController extends ChangeNotifier {
  TemplateController() {
  }
  @override
  void dispose() {
    super.dispose();
  }
}
