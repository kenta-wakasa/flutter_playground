import 'package:flutter/material.dart';
import 'package:flutter_playground/ui/jwt/jwt_provider.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class JwtPage extends ConsumerWidget {
  const JwtPage({Key key}) : super(key: key);

  /// どのインスタンスであっても不変な値を static として宣言する
  static const String title = 'JWT';
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final provider = watch(jwtProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          provider.init();
        },
      ),
    );
  }
}
