import 'package:flutter/material.dart';
import 'package:flutter_playground/ui/stopwatch/stopwatch_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
        title: CounterPage.title,
        description: 'RiverPod をつかったカウンターアプリです。',
        page: const CounterPage(),
      ),
      SampleData(
        title: StopwatchPage.title,
        description: 'StreamBuilderでストップウォッチを作っていみたい。',
        page: const StopwatchPage(),
      ),
    ];
  }
  List<SampleData> sampleDataList;
}
