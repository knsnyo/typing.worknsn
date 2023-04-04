import 'dart:async';
import 'package:app/src/bloc/user/user_bloc.dart';
import 'package:app/src/data/repository/user.dart';
import 'package:app/src/storage/storage.dart';
import 'package:app/src/utils/exception.dart';
import 'package:dio/dio.dart';

class UserViewModel {
  final UserBloc _userBloc;

  UserViewModel({required UserBloc userBloc}) : _userBloc = userBloc;

  Future<void> auto() async {
    try {
      await checkTokens();
      Map<String, String> tokens = await getTokens();
      Response res = await UserRepository.auto(tokens);
      String accessToken = res.data['accessToken'] as String;
      String refreshToken = res.data['refreshToken'] as String;
      await setTokens(accessToken, refreshToken);
      _userBloc.add(UserSigninEvent());
    } catch (err) {
      throw ViewModelException(message: 'UserViewModel.auto()');
    }
  }

  Future<Response> signup(String id, String password) async {
    Map<String, String> user = {'id': id, 'password': password};
    Response res = await UserRepository.signup(user);
    if (201 != res.statusCode) {
      throw ViewModelException(message: 'UserViewModel.signu()');
    }
    return res;
  }

  Future<Response> signin(String id, String password) async {
    Map<String, String> user = {'id': id, 'password': password};
    try {
      Response res = await UserRepository.signin(user);
      String accessToken = res.data['accessToken'] as String;
      String refreshToken = res.data['refreshToken'] as String;
      await setTokens(accessToken, refreshToken);
      _userBloc.add(UserSigninEvent());
      return res;
    } catch (err) {
      throw ViewModelException(message: 'UserViewModel.signin()');
    }
  }

  Future<void> signout() async {
    try {
      await removeTokens();
      _userBloc.add(UserSignoutEvent());
    } catch (err) {
      throw ViewModelException(message: 'UserViewModel.signout()');
    }
  }
}
