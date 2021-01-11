import 'package:flutter/material.dart';
import 'package:flutter_playground/ui/stopwatch/stopwatch_page.dart';
import 'package:flutter_riverpod/all.dart';

import '../../data/sample_data.dart';
import '../counter/counter_page.dart';

final sampleListProvider =
    ChangeNotifierProvider.autoDispose<SampleListController>(
  (ref) => SampleListController(),
);

class SampleListController extends ChangeNotifier {
  SampleListController() {
    sampleDataList = [
      SampleData(
        title: 'カウンター',
        description: 'RiverPod をつかったカウンターアプリです。',
        page: const CounterPage(title: 'カウンター'),
      ),
      SampleData(
        title: 'ストップウォッチ',
        description: 'StreamBuilderでストップウォッチを作っていみたい。',
        page: const StopwatchPage(title: 'ストップウォッチ'),
      ),
    ];
  }
  List<SampleData> sampleDataList;
}
