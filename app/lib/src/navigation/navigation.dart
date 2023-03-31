import 'package:app/src/bloc/auth_bloc.dart';
import 'package:app/src/ui/screens/home.dart';
import 'package:app/src/ui/screens/position.dart';
import 'package:app/src/ui/screens/setting.dart';
import 'package:app/src/ui/screens/short.dart';
import 'package:app/src/ui/screens/signin.dart';
import 'package:app/src/ui/screens/signup.dart';
import 'package:app/src/ui/screens/word.dart';
import 'package:flutter/material.dart';

late AuthBloc authBloc;

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  @override
  void initState() {
    super.initState();
    authBloc = AuthBloc();
    authBloc.init();
    authBloc.auto();
  }

  @override
  void dispose() {
    super.dispose();
    authBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (BuildContext context, Widget? child) => MediaQuery(
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
