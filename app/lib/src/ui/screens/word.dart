import 'package:app/src/ui/widget/keyboard.dart';
import 'package:app/src/ui/widget/count_word.dart';
import 'package:app/src/utils/title_bar.dart';
import 'package:flutter/material.dart';

class Word extends StatelessWidget {
  const Word({super.key});

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
              child: CountWord(),
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
