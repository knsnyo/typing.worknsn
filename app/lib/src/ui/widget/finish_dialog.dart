import 'package:app/src/ui/widget/count.dart';
import 'package:app/src/ui/widget/record.dart';
import 'package:app/src/navigation/navigation.dart';
import 'package:app/src/viewmodel/record_view_model.dart';
import 'package:flutter/material.dart';

int speed = 0;
RecordViewModel _recordViewModel = RecordViewModel();

class FinishDialog extends AlertDialog {
  const FinishDialog({super.key});

  @override
  Widget build(BuildContext context) {
    speed = (countViewModel.type / total * 60).round();
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
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/', (route) => false);
          },
          child: const Text('back', textScaleFactor: 1.5),
        ),
      ],
    );
  }

  void insertRecord() async {
    if (userViewModel.user && 'short' == countViewModel.category) {
      await _recordViewModel.insert(speed);
    }
  }
}
