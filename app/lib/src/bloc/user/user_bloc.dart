import 'package:app/src/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Cubit<UserModel> {
  UserBloc() : super(UserModel());

  void auto() {}
  void signup() {}
  void signin() {}
  void signout() {}
}
