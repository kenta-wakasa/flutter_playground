import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'animation_con.dart';
import 'painter.dart';

final animationProvider = ChangeNotifierProvider.autoDispose<AnimationCon>(
  (ref) => AnimationCon(),
);

class AnimationPage extends ConsumerWidget {
  const AnimationPage({Key key}) : super(key: key);

  static const String title = '⭐️';
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _provider = watch(animationProvider);
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        title: const Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (_provider.isPlaying) {
              _provider.stopLoop();
            } else {
              _provider.startLoop();
            }
          },
          backgroundColor: _provider.isPlaying ? Colors.yellow : Colors.green,
          child: Icon(
            _provider.isPlaying
                ? Icons.pause_rounded
                : Icons.play_arrow_rounded,
          )),
      body: Center(
        child: CustomPaint(
            painter: Painter(offsetList: _provider.destinationOffsetList)),
      ),
    );
  }
}
