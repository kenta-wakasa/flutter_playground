import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'canvas_controller.dart';
import 'painter.dart';

final canvasProvider = ChangeNotifierProvider.autoDispose<CanvasController>(
  (ref) => CanvasController(),
);

class CanvasPage extends ConsumerWidget {
  const CanvasPage({Key key}) : super(key: key);
  static const String title = 'Canvas';
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _provider = watch(canvasProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _provider.rotate90ccw();
        },
        child: const Icon(Icons.rotate_left_rounded),
      ),
      body: Center(
        child: Container(
          width: _provider.width,
          height: _provider.heihgt,
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child: CustomPaint(
            painter: Painter(offsetList: _provider.offsetList),
          ),
        ),
      ),
    );
  }
}
