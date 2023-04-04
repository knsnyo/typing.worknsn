import 'package:app/src/bloc/count/count_bloc.dart';
import 'package:app/src/ui/widget/count.dart';
import 'package:app/src/ui/widget/word.dart';
import 'package:app/src/viewmodel/count_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountWord extends StatelessWidget {
  const CountWord({super.key});

  @override
  Widget build(BuildContext context) {
    CountViewModel countViewModel = CountViewModel(
      countBloc: BlocProvider.of<CountBloc>(context),
    );
    countViewModel.setWord();
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        Flexible(flex: 1, child: Count()),
        Flexible(flex: 2, child: Word()),
      ],
    );
  }
}
