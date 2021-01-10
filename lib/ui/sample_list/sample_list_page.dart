import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/sample_data.dart';
import 'sample_list_controller.dart';

class SampleListPage extends ConsumerWidget {
  const SampleListPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _provider = watch(sampleListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'サンプルリスト',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(24),
        itemCount: _provider.sampleDataList.length,
        itemBuilder: (BuildContext context, int index) {
          return sampleCard(
            context,
            _provider.sampleDataList[index],
          );
        },
      ),
    );
  }

  Widget sampleCard(BuildContext context, SampleData sampleData) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
              builder: (context) {
                return sampleData.page;
              },
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                sampleData.title,
                style: Theme.of(context).textTheme.headline6,
              ),
              const Divider(),
              Text(
                sampleData.description,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
