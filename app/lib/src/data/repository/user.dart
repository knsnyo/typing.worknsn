import 'package:dio/dio.dart';

class UserRepository {
  static String url = 'http://0.0.0.0:5000/users';

  static Future<Response> auto(Map<String, String> tokens) async {
    try {
      return await Dio(BaseOptions(headers: tokens))
          .get<dynamic>('$url/signin');
    } catch (err) {
      throw Exception('DIO ERROR');
    }
  }

  static Future<Response> signup(Map<String, String> user) async {
    try {
      return await Dio().post<dynamic>('$url/signup', data: user);
    } catch (err) {
      throw Exception('DIO ERROR');
    }
  }

  static Future<Response> signin(Map<String, String> user) async {
    try {
      Response res = await Dio().post<dynamic>('$url/signin', data: user);
      return res;
    } catch (err) {
      throw Exception('DIO ERROR');
    }
  }
}
