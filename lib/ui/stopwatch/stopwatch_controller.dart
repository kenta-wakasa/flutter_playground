import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';

final stopwatchProvider =
    ChangeNotifierProvider.autoDispose<StopwatchController>(
  (ref) => StopwatchController(),
);

class StopwatchController extends ChangeNotifier {
  StopwatchController() {
    countStreamController = StreamController<int>();
    _count = 0;
    time10msec = '00';
    timeMin = '00';
    timeSec = '00';
    isWorking = false;
  }
  StreamController<int> countStreamController;
  int _count;
  String time10msec;
  String timeMin;
  String timeSec;
  Timer timer;
  bool isWorking;

  @override
  void dispose() {
    super.dispose();
    countStreamController.close();
    timer?.cancel();
  }

  void _tick(Timer timer) {
    _count++;
    countStreamController.add(_count);
    time10msec = (_count % 100).toString().padLeft(2, '0');
    timeSec = ((_count ~/ 100) % 60).toString().padLeft(2, '0');
    timeMin = ((_count ~/ 100) ~/ 60).toString().padLeft(2, '0');
  }

  void start() {
    isWorking = true;
    countStreamController = StreamController<int>();
    timer = Timer.periodic(const Duration(milliseconds: 10), _tick);
    notifyListeners();
  }

  void pause() {
    isWorking = false;
    timer.cancel();
    countStreamController.close();
    notifyListeners();
  }

  void reset() {
    isWorking = false;
    _count = 0;
    time10msec = '00';
    timeMin = '00';
    timeSec = '00';
    timer?.cancel();
    countStreamController.close();
    notifyListeners();
  }
}
