import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'freezed_controller.dart';

class FreezedPage extends ConsumerWidget {
  const FreezedPage({Key key}) : super(key: key);

  static const String title = 'Freezed';
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _provider = watch(freezedProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _provider.saveJsonFile();
        },
        child: const Icon(Icons.save),
      ),
      body: Column(
        children: [
          for (final user in _provider.userList)
            Text(user.toJson()['bookList'][1] as String),
          if (_provider?.userListJson != null)
            for (final jsonFile in _provider.userListJson) Text(jsonFile.path)
          else
            Container(),
          if (_provider?.readUserList != null)
            for (final user in _provider.readUserList) Text(user.name)
          else
            Container(),
        ],
      ),
    );
  }
}
