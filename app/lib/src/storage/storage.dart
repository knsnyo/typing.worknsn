import 'package:shared_preferences/shared_preferences.dart';

Future<void> setToken(String accessToken, String refreshToken) async {
  SharedPreferences storage = await SharedPreferences.getInstance();
  storage.setString('accessToken', accessToken);
  storage.setString('refreshToken', refreshToken);
}

Future<void> removeToken() async {
  SharedPreferences storage = await SharedPreferences.getInstance();
  storage.setString('accessToken', '');
  storage.setString('refreshToken', '');
}

Future<bool> checkToken() async {
  SharedPreferences storage = await SharedPreferences.getInstance();
  String? accessToken = storage.getString('accessToken');
  String? refreshToken = storage.getString('refreshToken');

  if ('' == accessToken) {
    return false;
  }
  if ('' == refreshToken) {
    return false;
  }
  return true;
}

Future<Map<String, String>> getTokens() async {
  SharedPreferences storage = await SharedPreferences.getInstance();
  String? accessToken = storage.getString('accessToken') ?? '';
  String? refreshToken = storage.getString('refreshToken') ?? '';

  return {'accessToken': accessToken, 'refreshToken': refreshToken};
}

Future<void> setAccessToken(String accessToken) async {
  SharedPreferences storage = await SharedPreferences.getInstance();
  storage.setString('accessToken', accessToken);
}
