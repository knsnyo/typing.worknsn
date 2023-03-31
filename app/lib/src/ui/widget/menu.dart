import 'package:app/src/ui/widget/level_button.dart';
import 'package:app/src/ui/widget/menu_button.dart';
import 'package:app/src/navigation/navigation.dart';
import 'package:app/src/utils/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: authBloc.user,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              LevelButton(
                                menuName: 'level 1',
                                routeName: '/position',
                                arguments: 0,
                              ),
                              LevelButton(
                                menuName: 'level 2',
                                routeName: '/position',
                                arguments: 1,
                              ),
                              LevelButton(
                                menuName: 'level 3',
                                routeName: '/position',
                                arguments: 2,
                              ),
                              LevelButton(
                                menuName: 'level 4',
                                routeName: '/position',
                                arguments: 3,
                              ),
                              LevelButton(
                                menuName: 'level 5',
                                routeName: '/position',
                                arguments: 4,
                              ),
                              LevelButton(
                                menuName: 'level 6',
                                routeName: '/position',
                                arguments: 5,
                              ),
                              LevelButton(
                                menuName: 'level 7',
                                routeName: '/position',
                                arguments: 6,
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: const Text('Position Practice'),
                ),
              ),
            ),
            const Flexible(
              child: Center(
                child: MenuButton(
                  menuName: 'Word Practice',
                  routeName: '/word',
                ),
              ),
            ),
            const Flexible(
              child: Center(
                child: MenuButton(
                  menuName: 'Short Sentence Practice',
                  routeName: '/short',
                ),
              ),
            ),
            checkMember(context),
            Flexible(
              child: Center(
                child: ElevatedButton(
                  onPressed: () => SystemNavigator.pop(),
                  child: const Text('Exit'),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  checkMember(BuildContext context) {
    if (authBloc.getUser) {
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
                    await authBloc.signout();
                    if (authBloc.getUser) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(failSnackbar('Sign Out Fail'));
                    } else {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(successSnackbar('Sign Out Success'));
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('/', (route) => false);
                    }
                  },
                  child: const Text('sign out'),
                ),
              ),
            ),
          ],
        ),
      );
    }
    return const Flexible(
      child: Center(
        child: MenuButton(
          menuName: 'Sign in',
          routeName: '/signin',
        ),
      ),
    );
  }
}
