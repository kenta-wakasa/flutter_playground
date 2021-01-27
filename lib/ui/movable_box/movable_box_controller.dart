import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../entity/box.dart';

final movableBoxProvider =
    ChangeNotifierProvider.autoDispose<MovableBoxController>(
  (ref) => MovableBoxController(),
);

class MovableBoxController extends ChangeNotifier {
  MovableBoxController() {
    boxes = [
      Box(pos: const Offset(100, 50), color: Colors.grey),
      Box(pos: const Offset(30, 200), color: Colors.grey),
      Box(pos: const Offset(200, 400), color: Colors.grey),
    ];
    tapPosition = const Offset(0, 0);
  }

  Offset tapPosition;
  List<Box> boxes = <Box>[];
  Box slectedBox;

  List<Widget> get boxesWidget {
    final _boxesWidget = <Widget>[];
    for (final box in boxes) {
      _boxesWidget.add(movableBox(box));
    }
    _boxesWidget.add(
      GestureDetector(
        dragStartBehavior: DragStartBehavior.down,
        onPanUpdate: (details) {
          tapPosition = details.localPosition;
          changePos(tapPosition);
          notifyListeners();
        },
      ),
    );
    return _boxesWidget;
  }

  Widget movableBox(Box box) {
    return Positioned(
      left: box.pos.dx,
      top: box.pos.dy,
      child: Container(
        height: 100,
        width: 100,
        color: box.color,
        child: GestureDetector(
          dragStartBehavior: DragStartBehavior.down,
          onTapDown: (details) {
            slectedBox = box;
            changeColor(box);
            notifyListeners();
          },
        ),
      ),
    );
  }

  void changeColor(Box box) {
    for (final _box in boxes) {
      if (_box == box) {
        _box.color = Colors.yellow;
      } else {
        _box.color = Colors.grey;
      }
    }
  }

  void changePos(Offset pos) {
    if (slectedBox != null) {
      boxes.firstWhere((box) => box == slectedBox).pos = pos;
    }
  }
}
