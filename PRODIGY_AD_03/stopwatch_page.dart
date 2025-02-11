
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stopwatch/stopwatch_provider.dart';

class StopwatchPage extends StatelessWidget {
  const StopwatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stopwatch'),
      ),
      body: Center(
        child: Consumer<StopwatchProvider>(
          builder: (context, stopwatch, child) {
            return Text(
              '${stopwatch.elapsedTime.inMinutes}:${stopwatch.elapsedTime.inSeconds.remainder(60).toString().padLeft(2, '0')}.${stopwatch.elapsedTime.inMilliseconds.remainder(1000).toString().padLeft(3, '0')}',
              style: const TextStyle(fontSize: 32),
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: null,
            child: const Icon(Icons.play_arrow),
            onPressed: () {
              Provider.of<StopwatchProvider>(context, listen: false).start();
            },
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            heroTag: null,
            child: const Icon(Icons.pause),
            onPressed: () {
              Provider.of<StopwatchProvider>(context, listen: false).pause();
            },
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            heroTag: null,
            child: const Icon(Icons.restore),
            onPressed: () {
              Provider.of<StopwatchProvider>(context, listen: false).reset();
            },
          ),
        ],
      ),
    );
  }
}