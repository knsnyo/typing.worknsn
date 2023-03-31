import 'package:app/src/ui/widget/count.dart';
import 'package:app/src/ui/widget/challenge.dart';
import 'package:app/src/ui/widget/record.dart';
import 'package:app/src/ui/widget/short_type.dart';
import 'package:app/src/navigation/navigation.dart';
import 'package:flutter/material.dart';

int speed = 0;

class FinishDialog extends AlertDialog {
  const FinishDialog({super.key});

  @override
  Widget build(BuildContext context) {
    speed = (countBloc.getType / total * 60).round();
    insertRecord();
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
            chulseokBloc.getList();
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/', (route) => false);
          },
          child: const Text('back', textScaleFactor: 1.5),
        ),
      ],
    );
  }

  insertRecord() async {
    if (authBloc.getUser && 'short' == countBloc.getCategory) {
      await recordBloc.insert(speed);
    }
  }
}
