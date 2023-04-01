import 'package:app/src/bloc/count/count_bloc.dart';
import 'package:app/src/ui/widget/record.dart';
import 'package:flutter/material.dart';

late CountBloc countBloc;

class Count extends StatefulWidget {
  final int max;
  final String category;
  const Count({super.key, required this.max, required this.category});

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  @override
  void initState() {
    super.initState();
    countBloc = CountBloc();
    countBloc.init(widget.max, widget.category);
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('progress: $count/${countBloc.getMax}', textScaleFactor: 1.5),
            const SizedBox(height: 10),
            const Record(),
          ],
        );
      },
    );
  }
}
