import 'package:app/src/bloc/count/count_bloc.dart';
import 'package:app/src/bloc/record/record_bloc.dart';
import 'package:app/src/bloc/user/user_bloc.dart';
import 'package:app/src/data/repository/record_repository.dart';
import 'package:app/src/models/count_model.dart';
import 'package:app/src/ui/widget/record.dart';
import 'package:app/src/utils/time_format.dart';
import 'package:app/src/viewmodel/record_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FinishDialog extends AlertDialog {
  const FinishDialog({super.key});

  @override
  Widget build(BuildContext context) {
    RecordRepository recordRepository = RecordRepository();
    RecordViewModel recordViewModel = RecordViewModel(
      recordBloc: BlocProvider.of<RecordBloc>(context),
      recordRepository: recordRepository,
    );
    Category category = BlocProvider.of<CountBloc>(context).state.category;
    int yourTypeTotal = BlocProvider.of<CountBloc>(context).state.total;
    int speed = (yourTypeTotal / total * 60).round();
    bool isSignin = BlocProvider.of<UserBloc>(context).state.user;
    return AlertDialog(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'time ${timeFormat(minute)}:${timeFormat(second)}',
            textScaleFactor: 1.5,
          ),
          Text('speed: $speed', textScaleFactor: 1.5),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () async {
            if (Category.short != category) {
              return;
            }
            if (!isSignin) {
              return;
            }
            await recordViewModel.insert(speed);
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/', (route) => false);
          },
          child: const Text('back', textScaleFactor: 1.5),
        ),
      ],
    );
  }
}
