import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unsplash_viewer_flutter/ui/home/home_screen.dart';

void main() {
  runApp(ProviderScope(
    child: MaterialApp(
      home: HomeScreen(),
    ),
  ));
}
