import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final filePickerProvider =
    ChangeNotifierProvider.autoDispose<FilePickerController>(
  (ref) => FilePickerController(),
);

class FilePickerController extends ChangeNotifier {
  FilePickerController() {
    /// 初期化処理をここに書く
    pickSuccess = false;
    fileName = '選択したファイル名がここに表示されます';
    fileContents = 'ファイルの中身がここに表示されます';
  }

  /// このプロバイダーが廃棄されるよきに呼ばれる
  @override
  void dispose() {
    super.dispose();
  }

  FilePickerResult filePickerResult; // 読み込んだ結果
  bool pickSuccess; // 読み込みが成功したら true

  File file;
  String fileName;
  String fileContents;

  Future<bool> get pickFileIsSuccess async {
    final _filePickerResult = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['txt'], // ピックする拡張子を限定できる。
    );
    if (_filePickerResult != null) {
      pickSuccess = true;
      filePickerResult = _filePickerResult;
      file = File(filePickerResult.files.single.path);
      fileName = filePickerResult.files.single.name;
    } else {
      pickSuccess = false;
      file = null;
      fileName = '何も選択されませんでした';
      fileContents = 'ファイルの中身がここに表示されます';
    }
    notifyListeners();
    return pickSuccess;
  }

  /// ファイルを読み込む
  void readFileContents() {
    if (file != null) {
      fileContents = file.readAsStringSync();
      notifyListeners();
    }
  }
}
