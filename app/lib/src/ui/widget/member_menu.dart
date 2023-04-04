import 'package:app/src/bloc/user/user_bloc.dart';
import 'package:app/src/data/repository/user_repository.dart';
import 'package:app/src/models/user_model.dart';
import 'package:app/src/ui/widget/menu_button.dart';
import 'package:app/src/utils/snack_bar.dart';
import 'package:app/src/viewmodel/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MemberMenu extends StatelessWidget {
  const MemberMenu({super.key});

  @override
  Widget build(BuildContext context) {
    UserRepository userRepository = UserRepository();
    UserViewModel userViewModel = UserViewModel(
      userBloc: BlocProvider.of<UserBloc>(context),
      userRepository: userRepository,
    );
    return BlocBuilder<UserBloc, UserModel>(
      builder: (BuildContext context, UserModel state) {
        if (!state.user) {
          return const Flexible(
            child: Center(
              child: MenuButton(
                menuName: 'Sign in',
                routeName: '/signin',
              ),
            ),
          );
        }
        return Flexible(
          flex: 2,
          child: Column(
            children: [
              const Flexible(
                child: Center(
                  child: MenuButton(
                    menuName: 'Setting',
                    routeName: '/setting',
                  ),
                ),
              ),
              Flexible(
                child: Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      try {
                        await userViewModel.signout();
                        ScaffoldMessenger.of(context)
                            .showSnackBar(successSnackbar('Sign Out Success'));
                        Navigator.of(context)
                            .pushNamedAndRemoveUntil('/', (route) => false);
                      } catch (err) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(failSnackbar('Sign Out Fail'));
                      }
                    },
                    child: const Text('sign out'),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
