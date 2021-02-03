import 'dart:math';

import 'package:flutter/material.dart';

class CanvasController extends ChangeNotifier {
  CanvasController() {
    width = 300;
    heihgt = 400;
    offsetList = const [
      Offset(100, 100),
      Offset(200, 100),
      Offset(200, 200),
      Offset(300, 200)
    ];
  }
  @override
  void dispose() {
    super.dispose();
  }

  double width;
  double heihgt;
  List<Offset> offsetList;

  /// アフィン変換は次のようになっている
  /// x' = x cosθ - y sinθ + tx
  /// y' = x sinθ + y cosθ + ty
  Offset _affinTranslate(Offset offset,
      {double radians = 0, double tx = 0, double ty = 0}) {
    final dx = offset.dx * cos(radians) - offset.dy * sin(radians) + tx;
    final dy = offset.dx * sin(radians) + offset.dy * cos(radians) + ty;
    return Offset(dx, dy);
  }

  void rotate90ccw() {
    final tmpWidth = width;
    width = heihgt;
    heihgt = tmpWidth;
    offsetList = offsetList
        .map((e) => _affinTranslate(e, radians: -pi / 2, ty: tmpWidth))
        .toList();
    notifyListeners();
  }
}
