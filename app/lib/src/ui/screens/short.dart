import 'package:app/src/ui/widget/count.dart';
import 'package:app/src/utils/title_bar.dart';
import 'package:flutter/material.dart';
import 'package:app/src/ui/widget/short_type.dart';

class Short extends StatelessWidget {
  const Short({super.key});

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
              flex: 1,
              child: Count(max: 10, category: 'short'),
            ),
            Flexible(flex: 3, child: ShortType()),
          ],
        ),
      ),
    );
  }
}
