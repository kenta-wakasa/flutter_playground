import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'http_test_controller.dart';

final httpTestProvider = ChangeNotifierProvider.autoDispose<HttpTestController>(
  (ref) => HttpTestController(),
);

class HttpTestPage extends ConsumerWidget {
  const HttpTestPage({Key key}) : super(key: key);
  static const String title = 'HTTP TEST';
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _provider = watch(httpTestProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('HTTP Test'),
      ),
      body: Center(
        child: SizedBox(
          height: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(_provider.getServerAddress()),
              const Spacer(flex: 2),
              ElevatedButton(
                onPressed: localhostServer.address != null
                    ? null
                    : () async {
                        await _provider.startLocalHostServer();
                      },
                child: const Text('Start Server'),
              ),
              const Spacer(flex: 1),
              ElevatedButton(
                onPressed: localhostServer.address == null
                    ? null
                    : () async {
                        await _provider.closeLocalHostServer();
                      },
                child: const Text('Close Server'),
              ),
              const Spacer(flex: 1),
              ElevatedButton(
                onPressed: () async {
                  await _provider.testHttp();
                },
                child: const Text('Start Browser'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
