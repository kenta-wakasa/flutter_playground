import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'counter_controller.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({Key key, this.title = 'サンプル'}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _provider = watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          _provider.increment();
        },
      ),
      body: Center(
        child: SizedBox(
          height: 100,
          width: 800,
          child: FittedBox(
            child: Text(
              _provider.count.toString(),
            ),
          ),
        ),
      ),
    );
  }
}
