import 'package:app/src/utils/app_bar.dart';
import 'package:app/src/components/description.dart';
import 'package:app/src/components/menu.dart';
import 'package:app/src/utils/padding.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: titleBar(),
      body: Container(
        padding: screenPadding(),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: const [
              Flexible(
                flex: 2,
                child: Menu(),
              ),
              Flexible(
                flex: 3,
                child: Description(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
