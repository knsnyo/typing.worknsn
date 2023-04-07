import 'dart:async';
import 'package:app/src/bloc/user/user_bloc.dart';
import 'package:app/src/data/models/user.dart';
import 'package:app/src/data/repository/user_repository.dart';
import 'package:app/src/storage/storage.dart';
import 'package:app/src/utils/custom_error.dart';
import 'package:dio/dio.dart';

class UserViewModel {
  final UserBloc _userBloc;
  final UserRepository _userRepository;

  UserViewModel({
    required UserBloc userBloc,
    required UserRepository userRepository,
  })  : _userBloc = userBloc,
        _userRepository = userRepository;

  Future<bool> auto() async {
    try {
      await checkTokens();
      Map<String, String> tokens = await getTokens();
      Response res = await _userRepository.auto(tokens);
      User newUser = User.fromJson(res.data as Map<String, dynamic>);
      String accessToken = newUser.accessToken;
      String refreshToken = newUser.refreshToken;
      await setTokens(accessToken, refreshToken);
      _userBloc.add(UserSigninEvent());
      return true;
    } catch (err) {
      return false;
    }
  }

  Future<bool> signup(String id, String password) async {
    Map<String, String> user = {'id': id, 'password': password};
    try {
      Response res = await _userRepository.signup(user);
      if (201 != res.statusCode) {
        throw ViewModelError(message: 'UserViewModel.signup()');
      }
      return true;
    } catch (err) {
      return false;
    }
  }

  Future<bool> signin(String id, String password) async {
    Map<String, String> user = {'id': id, 'password': password};
    try {
      Response res = await _userRepository.signin(user);
      User newUser = User.fromJson(res.data as Map<String, dynamic>);
      String accessToken = newUser.accessToken;
      String refreshToken = newUser.refreshToken;
      await setTokens(accessToken, refreshToken);
      _userBloc.add(UserSigninEvent());
      return true;
    } catch (err) {
      return false;
    }
  }

  Future<bool> signout() async {
    try {
      await removeTokens();
      _userBloc.add(UserSignoutEvent());
      return true;
    } catch (err) {
      return false;
    }
  }
}
