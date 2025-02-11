import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stopwatch/stopwatch_provider.dart';
import 'package:stopwatch/stopwatch_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => StopwatchProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Stopwatch',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StopwatchPage(),
    );
  }
}