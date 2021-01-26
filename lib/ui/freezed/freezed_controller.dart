import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as path;

import '../../entity/user.dart';
import '../../utils/app.dart';

final freezedProvider = ChangeNotifierProvider.autoDispose<FreezedController>(
  (ref) => FreezedController(),
);

class FreezedController extends ChangeNotifier {
  FreezedController() {
    _userList = <User>[
      const User(age: 6, name: 'kenta', bookList: ['ごま', 'しお']),
      const User(age: 250, name: 'konbu', bookList: ['かつお', 'わかめ']),
    ];
    () async {
      await readJsonFile();
    }();
  }
  @override
  void dispose() {
    super.dispose();
  }

  List<User> _userList;
  List<User> _readUserList;
  List<File> _userListJson;

  List<User> get userList => _userList;
  List<User> get readUserList => _readUserList;
  List<File> get userListJson => _userListJson;

  Future<void> saveJsonFile() async {
    final userListJson = <File>[];
    for (final user in userList) {
      userListJson.add(
        await File(path.join(App.directory.path, '${user.name}.json'))
            .writeAsString(
          jsonEncode(
            user.toJson(),
          ),
        ),
      );
    }
    _userListJson = userListJson;
    notifyListeners();
  }

  Future<void> readJsonFile() async {
    final readUserListist = <User>[];
    await for (final file in App.directory.list()) {
      if (file is File) {
        if (path.extension(file.path).contains('json')) {
          final jsonString = await file.readAsString();
          final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
          readUserListist.add(User.fromJson(jsonMap));
        }
      }
    }
    _readUserList = readUserListist;
    notifyListeners();
  }
}
