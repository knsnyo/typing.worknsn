import 'package:app/src/ui/widget/record.dart';
import 'package:app/src/viewmodel/count_view_model.dart';
import 'package:flutter/material.dart';

late CountViewModel countViewModel;

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
    countViewModel = CountViewModel();
    countViewModel.init(widget.max, widget.category);
  }

  @override
  void dispose() {
    super.dispose();
    countViewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: countViewModel.countStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        int count = (snapshot.data ?? 0) as int;
        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('progress: $count/${countViewModel.max}',
                textScaleFactor: 1.5),
            const SizedBox(height: 10),
            const Record(),
          ],
        );
      },
    );
  }
}
