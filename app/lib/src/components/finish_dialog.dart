import 'package:app/src/components/count.dart';
import 'package:app/src/components/record.dart';
import 'package:flutter/material.dart';

int speed = 0;

class FinishDialog extends AlertDialog {
  const FinishDialog({super.key});

  @override
  Widget build(BuildContext context) {
    speed = (countBloc.getType / total * 60).round();
    return AlertDialog(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'time ${percent2D(minute)}:${percent2D(second)}',
            textScaleFactor: 1.5,
          ),
          Text('speed: $speed', textScaleFactor: 1.5),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
          child: const Text('back', textScaleFactor: 1.5),
        ),
      ],
    );
  }
}
