import 'dart:async';
import 'package:app/src/bloc/user/user_bloc.dart';
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

  Future<void> auto() async {
    try {
      await checkTokens();
      Map<String, String> tokens = await getTokens();
      Response res = await _userRepository.auto(tokens);
      String accessToken = res.data['accessToken'] as String;
      String refreshToken = res.data['refreshToken'] as String;
      await setTokens(accessToken, refreshToken);
      _userBloc.add(UserSigninEvent());
    } catch (err) {
      throw ViewModelError(message: 'UserViewModel.auto()');
    }
  }

  Future<Response> signup(String id, String password) async {
    try {
      Map<String, String> user = {'id': id, 'password': password};
      Response res = await _userRepository.signup(user);
      if (201 != res.statusCode) {
        throw ViewModelError(message: 'UserViewModel.signup()');
      }
      return res;
    } catch (err) {
      throw ViewModelError(message: 'UserViewModel.signup()');
    }
  }

  Future<Response> signin(String id, String password) async {
    Map<String, String> user = {'id': id, 'password': password};
    try {
      Response res = await _userRepository.signin(user);
      String accessToken = res.data['accessToken'] as String;
      String refreshToken = res.data['refreshToken'] as String;
      await setTokens(accessToken, refreshToken);
      _userBloc.add(UserSigninEvent());
      return res;
    } catch (err) {
      throw ViewModelError(message: 'UserViewModel.signin()');
    }
  }

  Future<void> signout() async {
    try {
      await removeTokens();
      _userBloc.add(UserSignoutEvent());
    } catch (err) {
      throw ViewModelError(message: 'UserViewModel.signout()');
    }
  }
}
