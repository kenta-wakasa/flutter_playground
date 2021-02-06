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
  static const String title = 'アフィン変換';
  static const textStyle = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _provider = watch(canvasProvider);
    return Scaffold(
        appBar: AppBar(
            title: const Text(title,
                style: TextStyle(fontWeight: FontWeight.bold))),
        body: SafeArea(
            child: Stack(children: [
          Center(
            child: CustomPaint(
                painter: Painter(offsetList: _provider.destinationOffsetList)),
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                    height: 80,
                    width: 300,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Slider(
                              onChanged: (value) => _provider.radians = value,
                              value: _provider.radians,
                              min: 0,
                              max: 2 * pi),
                          const Text('Rotation', style: textStyle)
                        ])),
                SizedBox(
                    height: 80,
                    width: 300,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Slider(
                              value: _provider.scale,
                              onChanged: (value) => _provider.scale = value,
                              min: 1,
                              max: 20),
                          const Text('Scale', style: textStyle)
                        ]))
              ]),
          Align(
              alignment: Alignment.bottomCenter,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                  width: 160,
                  child: TextField(
                    style: const TextStyle(fontSize: 36),
                    decoration: const InputDecoration(
                        labelText: 'tx',
                        hintText: '0',
                        border: OutlineInputBorder()),
                    onChanged: (tx) {
                      _provider.tx = double.parse(tx);
                    },
                  ),
                ),
                const SizedBox(width: 16, height: 500),
                SizedBox(
                    width: 160,
                    child: TextField(
                        style: const TextStyle(fontSize: 36),
                        decoration: const InputDecoration(
                          labelText: 'ty',
                          hintText: '0',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (ty) {
                          _provider.ty = double.parse(ty);
                        }))
              ]))
        ])));
  }
}
