import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class SampleData {
  const SampleData({
    @required this.title,
    @required this.description,
    @required this.page,
  });
  final String title;
  final String description;
  final ConsumerWidget page;
}
