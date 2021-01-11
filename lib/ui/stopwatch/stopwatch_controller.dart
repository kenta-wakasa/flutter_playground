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
    count = 0;
    time10msec = '00';
    timeMin = '00';
    timeSec = '00';
    isWorking = false;
  }
  StreamController<int> countStreamController;
  int count;
  String time10msec;
  String timeMin;
  String timeSec;
  Timer timer;
  bool isWorking;

  void start() {
    isWorking = true;
    countStreamController = StreamController<int>();
    timer = Timer.periodic(const Duration(milliseconds: 10), _tick);
    notifyListeners();
  }

  void _tick(Timer timer) {
    count++;
    countStreamController.add(count);
    time10msec = (count % 100).toString().padLeft(2, '0');
    timeSec = ((count ~/ 100) % 60).toString().padLeft(2, '0');
    timeMin = ((count ~/ 100) ~/ 60).toString().padLeft(2, '0');
  }

  void pause() {
    isWorking = false;
    timer.cancel();
    countStreamController.close();
    notifyListeners();
  }

  void reset() {
    isWorking = false;
    count = 0;
    time10msec = '00';
    timeMin = '00';
    timeSec = '00';
    timer?.cancel();
    countStreamController.close();
    notifyListeners();
  }
}
