import 'dart:async';
import 'package:app/src/repository/user.dart';
import 'package:dio/dio.dart';

class AuthBloc {
  late bool _user;

  final StreamController _userSubject = StreamController.broadcast();

  bool get getUser => _user;
  Stream get user => _userSubject.stream;

  void init() {
    _user = false;
  }

  Future<void> signin(String id, String password) async {
    try {
      await UserRepository.signin(id, password);
      _user = true;
    } catch (err) {
      _user = false;
    } finally {
      _userSubject.sink.add(_user);
    }
  }

  Future<Response?> signup(String id, String password) async {
    try {
      Response? res = await UserRepository.signup(id, password);
      return res;
    } catch (err) {
      return null;
    }
  }

  Future<void> signout() async {
    try {
      await UserRepository.signout();
      _user = false;
    } catch (err) {
      _user = true;
    } finally {
      _userSubject.sink.add(_user);
    }
  }

  Future<void> auto() async {
    try {
      Response? res = await UserRepository.auto();
      if (200 != res?.data['status']) {
        throw Error();
      }
      _user = true;
    } catch (err) {
      _user = false;
    } finally {
      _userSubject.sink.add(_user);
    }
  }

  void dispose() {
    _userSubject.close();
  }
}
