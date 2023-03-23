import 'package:app/src/ui/home.dart';
import 'package:app/src/ui/position.dart';
import 'package:app/src/ui/setting.dart';
import 'package:app/src/ui/short.dart';
import 'package:app/src/ui/signin.dart';
import 'package:app/src/ui/signup.dart';
import 'package:app/src/ui/word.dart';
import 'package:flutter/material.dart';

class Navigation extends StatelessWidget {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
        child: child!,
      ),
      debugShowCheckedModeBanner: false,
      title: 'typing.worknsn',
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/position': (context) => const Position(),
        '/word': (context) => const Word(),
        '/short': (context) => const Short(),
        '/setting': (context) => const Setting(),
        '/signin': (context) => const Signin(),
        '/signup': (context) => const Signup(),
      },
    );
  }
}
