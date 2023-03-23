import 'package:app/src/components/keyboard.dart';
import 'package:app/src/components/count_position.dart';
import 'package:app/src/utils/app_bar.dart';
import 'package:flutter/material.dart';

class Position extends StatelessWidget {
  const Position({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: titleBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: const [
            Flexible(
              flex: 2,
              child: CountPosition(),
            ),
            Flexible(
              flex: 3,
              child: Keyboard(),
            ),
          ],
        ),
      ),
    );
  }
}
