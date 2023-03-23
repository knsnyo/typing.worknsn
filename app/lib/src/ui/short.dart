import 'package:app/src/components/count.dart';
import 'package:app/src/utils/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:app/src/components/short_type.dart';

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
              child: Count(),
            ),
            Flexible(flex: 3, child: ShortType()),
          ],
        ),
      ),
    );
  }
}
