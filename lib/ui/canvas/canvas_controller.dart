import 'dart:math';

import 'package:flutter/material.dart';

class CanvasController extends ChangeNotifier {
  CanvasController() {
    _radians = 0;
    _scale = 1;
    _tx = 0;
    _ty = 0;
    _initOffset = const Offset(0, -10); // 星型の最初の頂点を決める。
    _sourceOffsetList.add(_initOffset);
    // 星型は同一円の円周上を 4π/5 ずつ回転させた点を結ぶことで描ける。
    for (var radians = 0.0; radians <= 4 * pi; radians += 4 * pi / 5) {
      _sourceOffsetList.add(_affinTranslate(_initOffset, radians: radians));
    }
    _destinationOffsetList = _sourceOffsetList;
  }

  double _radians;
  double get radians => _radians;
  set radians(double radians) {
    _radians = radians;
    _update();
  }

  double _scale;
  double get scale => _scale;
  set scale(double scale) {
    _scale = scale;
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

  Offset _initOffset;
  final _sourceOffsetList = <Offset>[];
  List<Offset> _destinationOffsetList;
  List<Offset> get destinationOffsetList => _destinationOffsetList;

  /// 拡大・回転・平行移動のアフィン変換は次のようになっている
  /// ```
  /// dx =  scale　*　( x*cosθ - y*sinθ ) + tx
  /// dy =  scale　*　( x*sinθ + y*cosθ ) + ty
  /// ```
  Offset _affinTranslate(
    Offset pos, {
    double radians = 0,
    double scale = 1.0,
    double tx = 0,
    double ty = 0,
  }) {
    final dx = scale * (pos.dx * cos(radians) - pos.dy * sin(radians)) + tx;
    final dy = scale * (pos.dx * sin(radians) + pos.dy * cos(radians)) + ty;
    return Offset(dx, dy);
  }

  /// すべての offset に対してアフィン変換をかける
  void _update() {
    _destinationOffsetList = _sourceOffsetList
        .map((s) =>
            _affinTranslate(s, radians: radians, scale: scale, tx: tx, ty: ty))
        .toList();
    notifyListeners();
  }
}
