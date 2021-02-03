import 'dart:math';

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
      body: Stack(
        children: [
          Center(
            child: CustomPaint(
              painter: Painter(offsetList: _provider.destinationOffsetList),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 200,
              width: 300,
              child: Slider(
                value: _provider.radians,
                onChanged: (radians) {
                  _provider.radians = radians;
                },
                min: 0,
                max: 4 * pi,
              ),
            ),
          ),
          Positioned(
            right: 80,
            bottom: 120,
            child: Row(
              children: [
                SizedBox(
                  width: 50,
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'tx',
                      hintText: '0',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (tx) {
                      _provider.tx = double.parse(tx);
                    },
                  ),
                ),
                const SizedBox(width: 16),
                SizedBox(
                  width: 50,
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: 'ty',
                      hintText: '0',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (ty) {
                      _provider.ty = double.parse(ty);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
