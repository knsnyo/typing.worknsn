import 'package:app/src/bloc/user/user_bloc.dart';
import 'package:app/src/data/repository/user_repository.dart';
import 'package:app/src/utils/title_bar.dart';
import 'package:app/src/utils/screen_padding.dart';
import 'package:app/src/utils/snack_bar.dart';
import 'package:app/src/viewmodel/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _idController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    UserRepository userRepository = UserRepository();
    UserViewModel userViewModel = UserViewModel(
      userBloc: BlocProvider.of<UserBloc>(context),
      userRepository: userRepository,
    );
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
                child: Text('SIGN UP', textScaleFactor: 3.0),
              ),
              Flexible(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
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
                          return 'Please Enter your Password';
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
                        if (!_formKey.currentState!.validate()) {
                          return;
                        }
                        String id = _idController.text;
                        String password = _passwordController.text;
                        bool result = await userViewModel.signup(id, password);
                        if (result) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(successSnackbar('Sign Up Success'));
                          Navigator.pop(context);
                          return;
                        }
                        ScaffoldMessenger.of(context)
                            .showSnackBar(failSnackbar('Sign Up Fail'));
                      },
                      child: const Text('Sign up', textScaleFactor: 1.0),
                    ),
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
