import 'package:app/src/constants/constants.dart';
import 'package:app/src/utils/custom_error.dart';
import 'package:dio/dio.dart';

class UserRepository {
  Future<Response> auto(Map<String, String> tokens) async {
    try {
      return await Dio(BaseOptions(headers: tokens))
          .get<dynamic>('$userUrl/signin');
    } catch (err) {
      throw CustomDioError(message: 'UserRepository.auto()');
    }
  }

  Future<Response> signup(Map<String, String> user) async {
    try {
      return await Dio().post<dynamic>('$userUrl/signup', data: user);
    } catch (err) {
      throw CustomDioError(message: 'UserRepository.signup()');
    }
  }

  Future<Response> signin(Map<String, String> user) async {
    try {
      return await Dio().post<dynamic>('$userUrl/signin', data: user);
    } catch (err) {
      throw CustomDioError(message: 'UserRepository.signin()');
    }
  }
}
