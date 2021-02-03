import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../entity/sample_data.dart';
import '../canvas/canvas_page.dart';
import '../clear_button/clear_button_page.dart';
import '../counter/counter_page.dart';
import '../file_picker/file_picker_page.dart';
import '../freezed/freezed_page.dart';
import '../http_test/http_test_page.dart';
import '../io/io_page.dart';
import '../movable_box/movable_box_page.dart';
import '../stopwatch/stopwatch_page.dart';

final sampleListProvider =
    ChangeNotifierProvider.autoDispose<SampleListController>(
  (ref) => SampleListController(),
);

class SampleListController extends ChangeNotifier {
  SampleListController() {
    sampleDataList = [
      const SampleData(
        title: CounterPage.title,
        description: 'RiverPod をつかったカウンターアプリです。',
        page: CounterPage(),
      ),
      const SampleData(
        title: StopwatchPage.title,
        description: 'StreamBuilderでストップウォッチを作っていみたい。',
        page: StopwatchPage(),
      ),
      const SampleData(
        title: IoPage.title,
        description: '外部データの読み込みと書き出しをやりたい。',
        page: IoPage(),
      ),
      const SampleData(
        title: FilePickerPage.title,
        description: 'ファイルピッカーを使ってみたい',
        page: FilePickerPage(),
      ),
      const SampleData(
        title: ClearButtonPage.title,
        description: '閉じるボタンのあるダイアログ',
        page: ClearButtonPage(),
      ),
      const SampleData(
        title: FreezedPage.title,
        description: 'Freezedを使ってみたい。',
        page: FreezedPage(),
      ),
      const SampleData(
        title: MovableBoxPage.title,
        description: 'ドラッグでオブジェクトを動かしたい。',
        page: MovableBoxPage(),
      ),
      const SampleData(
        title: HttpTestPage.title,
        description: 'サーバーと通信してみたい',
        page: HttpTestPage(),
      ),
      const SampleData(
        title: CanvasPage.title,
        description: '座標の回転をやってみたい',
        page: CanvasPage(),
      ),
    ];
  }
  List<SampleData> sampleDataList;
}
