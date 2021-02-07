import 'dart:math';

import 'package:flutter/material.dart';

class AnimationCon extends ChangeNotifier {
  AnimationCon() {
    _sourceOffset = const Offset(0, -160);
    _destOffsetList.add(_sourceOffset);
  }
  @override
  void dispose() {
    super.dispose();
    _start = false;
  }

  Offset _sourceOffset;
  final _destOffsetList = <Offset>[];
  var _start = false;
  var _isPlaying = false;
  var _radians = 0.0;
  final _fps = 60;

  List<Offset> get destinationOffsetList => _destOffsetList;
  bool get start => _start;
  bool get isPlaying => _isPlaying;

  Future<void> _mainloop() async {
    const fractionSize = 120;
    _isPlaying = true;
    var frame = 0;
    final waitTime = 1000000 ~/ _fps;
    while (start) {
      _destOffsetList[_destOffsetList.length - 1] =
          _affinTranslate(_sourceOffset, radians: _radians);
      if (frame % (2 * fractionSize ~/ 5) == 0) {
        _destOffsetList.add(_destOffsetList[_destOffsetList.length - 1]);
        if (frame == fractionSize * 2) {
          _start = false;
        }
      }
      frame++;
      _radians += 2 * pi / fractionSize;
      notifyListeners();
      await Future<void>.delayed(Duration(microseconds: waitTime));
    }
    _isPlaying = false;
    notifyListeners();
  }

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

  void startLoop() {
    if (!_isPlaying) {
      _start = true;
      _mainloop();
    }
  }

  void stopLoop() {
    if (_isPlaying) {
      _start = false;
    }
  }
}
