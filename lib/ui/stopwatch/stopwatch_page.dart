import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'stopwatch_controller.dart';

class StopwatchPage extends ConsumerWidget {
  const StopwatchPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _provider = watch(stopwatchProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          StreamBuilder(
            stream: _provider.countStreamController.stream,
            builder: (BuildContext context, AsyncSnapshot<int> snapShot) {
              return Text(
                '${_provider.timeMin} : '
                '${_provider.timeSec} : '
                '${_provider.time10msec}',
                style: const TextStyle(
                  // 等幅フォントにできる
                  fontFeatures: [FontFeature.tabularFigures()],
                  fontSize: 24,
                ),
              );
            },
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                child: const Text('reset'),
                onPressed: () {
                  _provider.reset();
                },
              ),
              const SizedBox(width: 16),
              RaisedButton(
                child: _provider.isWorking
                    ? const Text('pause')
                    : const Text('start'),
                onPressed: () {
                  _provider.isWorking ? _provider.pause() : _provider.start();
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
