import 'package:flutter/material.dart';
import 'package:flutter_widgets_learning/calendar/calendar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:overlay_support/overlay_support.dart';

// A Counter example implemented with riverpod

void main() {
  runApp(
    // MyApp(),
    // Adding ProviderScope enables Riverpod for the entire project
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return OverlaySupport(child: MaterialApp(home: Home()));
    return MaterialApp(home: Home());
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Calendar();
  }
}
