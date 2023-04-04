import 'package:app/src/utils/custom_error.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class UserRepository {
  final String url = dotenv.env['USER_URL']!;

  Future<Response> auto(Map<String, String> tokens) async {
    try {
      return await Dio(BaseOptions(headers: tokens))
          .get<dynamic>('$url/signin');
    } catch (err) {
      throw CustomDioError(message: 'UserRepository.auto()');
    }
  }

  Future<Response> signup(Map<String, String> user) async {
    try {
      return await Dio().post<dynamic>('$url/signup', data: user);
    } catch (err) {
      throw CustomDioError(message: 'UserRepository.signup()');
    }
  }

  Future<Response> signin(Map<String, String> user) async {
    try {
      return await Dio().post<dynamic>('$url/signin', data: user);
    } catch (err) {
      throw CustomDioError(message: 'UserRepository.signin()');
    }
  }
}
