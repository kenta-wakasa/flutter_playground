import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final animatedListProvider = ChangeNotifierProvider.autoDispose(
  (ref) => AnimatedListProvider._(),
);

class AnimatedListProvider extends ChangeNotifier {
  AnimatedListProvider._();
  final Random _random = Random();

  List<Color> itemList = [];

  void addListItem() {
    itemList.add(randomColor);
    notifyListeners();
  }

  Color get randomColor {
    return Color.fromARGB(
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
    );
  }
}
