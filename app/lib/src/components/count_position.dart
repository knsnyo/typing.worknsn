import 'package:app/src/components/count.dart';
import 'package:app/src/components/position.dart';
import 'package:flutter/material.dart';

class CountPosition extends StatelessWidget {
  const CountPosition({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        Flexible(
          flex: 1,
          child: Count(max: 100, category: 'position'),
        ),
        Flexible(
          flex: 2,
          child: Position(),
        ),
      ],
    );
  }
}
