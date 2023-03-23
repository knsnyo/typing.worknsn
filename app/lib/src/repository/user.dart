import 'package:app/src/models/user.dart';
import 'package:app/src/storage/storage.dart';
import 'package:dio/dio.dart';

class UserRepository {
  static String url = 'http://0.0.0.0:5000/users';

  static Future<Response?> signin(String id, String password) async {
    try {
      Response res = await Dio().post('$url/signin', data: {
        'id': id,
        'password': password,
      });
      User user = User.fromJson(res.data);
      await setToken(user.accessToken, user.refreshToken);
      return res;
    } catch (err) {
      return null;
    }
  }

  static Future<Response?> signup(String id, String password) async {
    try {
      Response res = await Dio().post('$url/signup', data: {
        'id': id,
        'password': password,
      });
      return res;
    } catch (err) {
      return null;
    }
  }

  static Future<void> signout() async {
    try {
      await removeToken();
    } catch (err) {}
  }
}
