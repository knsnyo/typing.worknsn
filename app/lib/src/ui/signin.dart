import 'package:app/src/components/menu_button.dart';
import 'package:app/src/navigation/navigation.dart';
import 'package:app/src/utils/app_bar.dart';
import 'package:app/src/utils/padding.dart';
import 'package:app/src/utils/snackbar.dart';
import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _formKey = GlobalKey<FormState>();
  final _idController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _idController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: titleBar(),
      body: Container(
        padding: screenPadding(),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Flexible(
                flex: 1,
                child: Text('SIGN IN', textScaleFactor: 3.0),
              ),
              Flexible(
                flex: 2,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'ID',
                        prefixIcon: Icon(Icons.person),
                      ),
                      controller: _idController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter your ID';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'PASSWORD',
                        prefixIcon: Icon(Icons.https),
                      ),
                      controller: _passwordController,
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter your Passsword';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          String id = _idController.text;
                          String password = _passwordController.text;
                          await authBloc.signin(id, password);
                          if (!authBloc.getUser) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(failSnackbar('Sign In Fail'));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                successSnackbar('Sign In Success'));
                            Navigator.of(context)
                                .pushNamedAndRemoveUntil('/', (route) => false);
                          }
                        }
                      },
                      child: const Text('Sign in', textScaleFactor: 1.0),
                    ),
                    const MenuButton(menuName: 'Sign up', routeName: '/signup'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
