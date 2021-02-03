import 'dart:math';

import 'package:flutter/material.dart';

class CanvasController extends ChangeNotifier {
  CanvasController() {
    _radians = 0;
    _tx = 0;
    _ty = 0;
    _sourceOffsetList = const [
      Offset(0, 0),
      Offset(100, 0),
      Offset(140, 110),
    ];
    _destinationOffsetList = _sourceOffsetList;
  }
  @override
  void dispose() {
    super.dispose();
  }

  double _radians;
  double get radians => _radians;
  set radians(double radians) {
    _radians = radians;
    _update();
  }

  double _tx;
  double get tx => _tx;
  set tx(double tx) {
    _tx = tx;
    _update();
  }

  double _ty;
  double get ty => _ty;
  set ty(double ty) {
    _ty = ty;
    _update();
  }

  List<Offset> _sourceOffsetList;
  List<Offset> _destinationOffsetList;
  List<Offset> get destinationOffsetList => _destinationOffsetList;

  /// アフィン変換は次のようになっている
  /// x' = x cosθ - y sinθ + tx
  /// y' = x sinθ + y cosθ + ty
  Offset _affinTranslate(Offset offset,
      {double radians = 0, double tx = 0, double ty = 0}) {
    final dx = offset.dx * cos(radians) - offset.dy * sin(radians) + tx;
    final dy = offset.dx * sin(radians) + offset.dy * cos(radians) + ty;
    return Offset(dx, dy);
  }

  void _update() {
    _destinationOffsetList = _sourceOffsetList
        .map((_sourceOffsetList) => _affinTranslate(_sourceOffsetList,
            radians: radians, tx: tx, ty: ty))
        .toList();
    notifyListeners();
  }
}
