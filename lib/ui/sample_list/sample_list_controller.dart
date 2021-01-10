import 'package:flutter/material.dart';
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
    ];
  }
  List<SampleData> sampleDataList;
}
