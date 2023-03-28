import 'dart:async';

import 'package:flutter/material.dart';

late Stopwatch stopwatch;
late int total;
late int minute;
late int second;

class Record extends StatefulWidget {
  const Record({super.key});

  @override
  State<Record> createState() => _RecordState();
}

class _RecordState extends State<Record> {
  @override
  void initState() {
    super.initState();
    stopwatch = Stopwatch();
    stopwatch.reset();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(milliseconds: 100)),
      builder: (context, snapshot) {
        total = (stopwatch.elapsedMilliseconds / 1000).floor();
        minute = total ~/ 60;
        second = total % 60;
        return Text(
          "${percent2D(minute)}:${percent2D(second)}",
          textScaleFactor: 1.5,
        );
      },
    );
  }
}

/// %2d
String percent2D(int number) {
  if (number < 10) {
    return '0$number';
  }
  return '$number';
}
