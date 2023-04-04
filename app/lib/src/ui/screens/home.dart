import 'package:app/src/bloc/user/user_bloc.dart';
import 'package:app/src/data/repository/user_repository.dart';
import 'package:app/src/utils/title_bar.dart';
import 'package:app/src/ui/widget/challenge.dart';
import 'package:app/src/ui/widget/menu.dart';
import 'package:app/src/utils/screen_padding.dart';
import 'package:app/src/viewmodel/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    UserRepository userRepository = UserRepository();
    UserViewModel userViewModel = UserViewModel(
      userBloc: BlocProvider.of<UserBloc>(context),
      userRepository: userRepository,
    );
    userViewModel.auto();
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
                flex: 1,
                child: Menu(),
              ),
              Flexible(
                flex: 3,
                child: Challenge(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
