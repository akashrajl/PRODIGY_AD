import 'dart:async';

import 'package:flutter/material.dart';

class StopwatchProvider extends ChangeNotifier {
  Stopwatch _stopwatch = Stopwatch();
  Timer? _timer;

  bool _isRunning = false;

  Duration get elapsedTime => _stopwatch.elapsed;

  bool get isRunning => _isRunning;

  void start() {
    _isRunning = true;
    _stopwatch.start();
    _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      notifyListeners();
    });
  }

  void pause() {
    _isRunning = false;
    _stopwatch.stop();
    if (_timer != null) {
      _timer!.cancel();
    }
  }

  void reset() {
    _isRunning = false;
    _stopwatch.reset();
    _timer?.cancel();
    _timer = null;
    notifyListeners();
  }
}