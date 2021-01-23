import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'clear_button_controller.dart';

class ClearButtonPage extends ConsumerWidget {
  const ClearButtonPage({Key key}) : super(key: key);

  static const String title = '閉じるボタン';
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _provider = watch(clearButtonProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: SizedBox(
          height: 100,
          child: ElevatedButton(
            onPressed: () {
              showDialog<void>(
                context: context,
                builder: (_) {
                  return ClearButtonDialog();
                },
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'ダイアログを開く',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                Text(
                  '${_provider.count}',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// 閉じるボタンのあるダイアログ
class ClearButtonDialog extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final _provider = watch(clearButtonProvider);
    const _buttonSize = 24.0;
    final _dialogWidth = MediaQuery.of(context).size.width * 3 / 4;
    return Dialog(
      insetPadding: const EdgeInsets.all(0),
      elevation: 0,
      backgroundColor: Colors.transparent,
      // child: LayoutBuilder
      child: SizedBox(
        width: _dialogWidth,
        height: _dialogWidth * 3 / 4,
        child: Stack(
          alignment: Alignment.center,
          children: [
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Container(
                  width: constraints.maxWidth - _buttonSize,
                  height: constraints.maxHeight - _buttonSize,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    // mainAxisSize: ,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      const Text(
                        'カウントアップ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const Divider(),
                      SizedBox(
                        width: 32,
                        height: 32,
                        child: Center(
                            child: Text(
                          '${_provider.count}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        )),
                        //child: _provider.scanningDevicesIndicator),
                      ),
                      const Divider(),
                      FloatingActionButton(
                        onPressed: () {
                          _provider.increment();
                        },
                        child: const Icon(Icons.plus_one),
                      )
                    ],
                  ),
                );
              },
            ),
            Align(
              alignment: Alignment.topLeft,
              child: closeButton(
                context,
                _buttonSize,
                () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget closeButton(
  BuildContext context,
  double buttonSize,
  Function() onPressed,
) {
  return SizedBox(
    width: buttonSize * 1.2,
    height: buttonSize * 1.2,
    child: FloatingActionButton(
      child: Icon(
        // Icons.close,
        Icons.clear,
        size: buttonSize,
        color: Colors.white,
      ),
      onPressed: () {
        onPressed();
      },
    ),
  );
}
