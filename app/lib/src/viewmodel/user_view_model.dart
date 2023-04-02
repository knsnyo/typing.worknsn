import 'dart:async';
import 'package:app/src/data/repository/user.dart';
import 'package:app/src/models/user_model.dart';
import 'package:app/src/storage/storage.dart';
import 'package:dio/dio.dart';

class UserViewModel {
  final UserModel _userModel = UserModel();
  final StreamController<bool> _userController =
      StreamController<bool>.broadcast();
  Stream<bool> get userStream => _userController.stream;

  bool get user => _userModel.user;

  void init() => _userController.sink.add(_userModel.user);

  Future<void> auto() async {
    try {
      await checkTokens();
      Map<String, String> tokens = await getTokens();
      Response res = await UserRepository.auto(tokens);
      String accessToken = res.data['accessToken'] as String;
      String refreshToken = res.data['refreshToken'] as String;
      await setTokens(accessToken, refreshToken);
      _userModel.user = true;
      _userController.sink.add(_userModel.user);
    } catch (err) {
      _userController.sink.addError(err);
    }
  }

  Future<Response> signup(String id, String password) async {
    Map<String, String> user = {'id': id, 'password': password};
    return await UserRepository.signup(user);
  }

  Future<void> signin(String id, String password) async {
    Map<String, String> user = {'id': id, 'password': password};
    try {
      Response res = await UserRepository.signin(user);
      String accessToken = res.data['accessToken'] as String;
      String refreshToken = res.data['refreshToken'] as String;
      await setTokens(accessToken, refreshToken);
      _userModel.user = true;
      _userController.sink.add(_userModel.user);
    } catch (err) {
      _userController.sink.addError(err);
    }
  }

  Future<void> signout() async {
    try {
      await removeTokens();
      _userModel.user = false;
      _userController.sink.add(_userModel.user);
    } catch (err) {
      _userController.sink.addError(err);
    }
  }

  void dispose() => _userController.close();
}
