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
  /// -90 度回転では cos(-pi/2) = 0, sin(-pi/2) = -1 となる。つまり...
  /// x' = x *  0 - y * 1 + tx =>  y + tx
  /// y' = x * -1 - y * 0 + ty => -x + ty
  /// canvas の原点の位置が回転によりずれるため、
  /// y 軸方向に回転前の width だけ平行移動する
  void rotate90ccw() {
    final tmpWidth = width;
    width = heihgt;
    heihgt = tmpWidth;
    final tmpOffsetList = <Offset>[];
    for (final offset in offsetList) {
      final dx = offset.dy;
      final dy = -offset.dx + tmpWidth;
      tmpOffsetList.add(Offset(dx, dy));
    }
    offsetList = tmpOffsetList;
    notifyListeners();
  }
}
