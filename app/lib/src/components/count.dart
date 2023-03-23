import 'package:app/src/bloc/count_bloc.dart';
import 'package:flutter/material.dart';

late CountBloc countBloc;

class Count extends StatefulWidget {
  const Count({super.key});

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  @override
  void initState() {
    super.initState();
    countBloc = CountBloc();
    countBloc.init();
  }

  @override
  void dispose() {
    super.dispose();
    countBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: countBloc.count,
      builder: (context, snapshot) {
        int count = snapshot.data ?? 0;
        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('progress: $count/100', textScaleFactor: 1.5),
          ],
        );
      },
    );
  }
}
