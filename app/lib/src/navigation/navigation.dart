import 'package:app/src/bloc/position/position_bloc.dart';
import 'package:app/src/ui/screens/home.dart';
import 'package:app/src/ui/screens/position.dart';
import 'package:app/src/ui/screens/setting.dart';
import 'package:app/src/ui/screens/short.dart';
import 'package:app/src/ui/screens/signin.dart';
import 'package:app/src/ui/screens/signup.dart';
import 'package:app/src/ui/screens/word.dart';
import 'package:app/src/viewmodel/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

late UserViewModel userViewModel;

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  @override
  void initState() {
    super.initState();
    userViewModel = UserViewModel();
    userViewModel.init();
    userViewModel.auto();
  }

  @override
  void dispose() {
    super.dispose();
    userViewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PositionBloc>(
            create: (BuildContext context) => PositionBloc()),
      ],
      child: MaterialApp(
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
      ),
    );
  }
}
