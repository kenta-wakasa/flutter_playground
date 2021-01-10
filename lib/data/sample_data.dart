import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SampleData {
  SampleData({
    @required this.title,
    @required this.description,
    @required this.page,
  });
  String title = '';
  String description = '';
  ConsumerWidget page;
}
