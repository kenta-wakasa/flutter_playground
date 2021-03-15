import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final jwtProvider = ChangeNotifierProvider.autoDispose<JwtProvider>(
  (ref) => JwtProvider(),
);

class JwtProvider extends ChangeNotifier {
  JwtProvider();

  void init() {
    // keyの生成
    final random = Random.secure();

    // key の生成方法はこれであっているのか。
    final values = List<int>.generate(32, (i) => random.nextInt(255));
    final key = base64UrlEncode(values).split('=').first;
    print(key);
    // final sampleKey = 'iFWK6fWdcTlgnzuFn0g04CWUsRaq71gGhRM8wTRzyDj';

    final bytes = utf8.encode(
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9'
      '.'
      'eyJkb2N1bWVudHMiOlt7InRlbXBsYXRlIjoiaHR0cHM6Ly90ZW1wbGF0ZXMuZXhhbXBsZS5jb20vdGVtcGxhdGVzL0R4ckpjNEZoa3ludHV1bWQ4b2MvNFE5Um9jZnpzQjlja1lkWitLSnlEOTZ5RGcvbnM1ZG55azR2RXJuWU9zV3gvaW5kZXguanNvbiIsInBhZ2VzIjpbeyJwYWdlLW51bWJlciI6MSwic3Ryb2tlcyI6IkRnVmJ1aEVockd2SW0xRmwwT3JobzNKQWk3aWcwMGVuTzNOclkraXZaNGR4U2w4eFdqN3hMTzN1MnNLQjBwdmMifV19XX0',
    );
    // final hmacSha256 = Hmac(sha256, utf8.encode(sampleKey));
    final hmacSha256 = Hmac(sha256, utf8.encode(key));
    final digest = hmacSha256.convert(bytes);

    final base64EUrlEncode = base64UrlEncode(digest.bytes).split('=').first;
    print('$base64EUrlEncode');
  }
}
