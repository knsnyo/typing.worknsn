import 'package:shared_preferences/shared_preferences.dart';

setToken(String accessToken, String refreshToken) async {
  SharedPreferences storage = await SharedPreferences.getInstance();
  storage.setString('accessToken', accessToken);
  storage.setString('refreshToken', refreshToken);
}

removeToken() async {
  SharedPreferences storage = await SharedPreferences.getInstance();
  storage.setString('accessToken', '');
  storage.setString('refreshToken', '');
}

checkToken() async {
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
