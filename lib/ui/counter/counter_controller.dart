import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';

final counterProvider = ChangeNotifierProvider.autoDispose<CounterController>(
  (ref) => CounterController(),
);

class CounterController extends ChangeNotifier {
  CounterController() {
    count = 0;
  }
  int count;

  @override
  void dispose() {
    super.dispose();
    print('dispose');
  }

  void increment() {
    count++;
    notifyListeners();
  }
}
