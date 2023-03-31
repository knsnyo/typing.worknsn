import 'package:app/src/ui/widget/count.dart';
import 'package:app/src/ui/widget/word.dart';
import 'package:flutter/material.dart';

class CountWord extends StatelessWidget {
  const CountWord({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        Flexible(
          flex: 1,
          child: Count(max: 100, category: 'word'),
        ),
        Flexible(
          flex: 2,
          child: Word(),
        ),
      ],
    );
  }
}
