import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'ui/sample_list/sample_list_page.dart';
import 'utils/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await App().init();
  runApp(
    ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Playground',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SampleListPage(),
    );
  }
}
