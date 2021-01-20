import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/sample_data.dart';
import '../counter/counter_page.dart';
import '../file_picker/file_picker_page.dart';
import '../io/io_page.dart';
import '../stopwatch/stopwatch_page.dart';

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
      SampleData(
        title: IoPage.title,
        description: '外部データの読み込みと書き出しをやりたい。',
        page: const IoPage(),
      ),
      SampleData(
        title: FilePickerPage.title,
        description: 'ファイルピッカーを使ってみたい',
        page: const FilePickerPage(),
      ),
    ];
  }
  List<SampleData> sampleDataList;
}
