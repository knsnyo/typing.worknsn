import 'package:app/src/utils/app_bar.dart';
import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: titleBar(),
    );
  }
}

// https://pub.dev/packages/syncfusion_flutter_charts