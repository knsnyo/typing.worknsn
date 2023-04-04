import 'package:app/src/bloc/user/user_bloc.dart';
import 'package:app/src/ui/widget/count.dart';
import 'package:app/src/ui/widget/record.dart';
import 'package:app/src/viewmodel/record_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

int speed = 0;
RecordViewModel _recordViewModel = RecordViewModel();

class FinishDialog extends AlertDialog {
  const FinishDialog({super.key});

  void insertRecord() async {
    if ('short' != countViewModel.category) {
      return;
    }
    await _recordViewModel.insert(speed);
  }

  @override
  Widget build(BuildContext context) {
    speed = 0 != total ? (countViewModel.total / total * 60).round() : 0;
    bool isSignin = BlocProvider.of<UserBloc>(context).state.user;
    if (isSignin) {
      insertRecord();
    }
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
}
