import 'package:app/src/models/chulseok.dart';
import 'package:app/src/storage/storage.dart';
import 'package:dio/dio.dart';

class ChulseokRepository {
  static String url = 'http://0.0.0.0:5000/info/chulseoks';

  static Future<List<Chulseok>?> getList() async {
    try {
      bool isToken = await checkToken();
      if (!isToken) {
        return null;
      }
      Map<String, String> tokens = await getTokens();
      Response res = await Dio(BaseOptions(headers: tokens)).get(url);
      if (null != res.data['accessToken']) {
        await setAccessToken(res.data['accessToken']);
        tokens = await getTokens();
      }
      List<Chulseok> chulseoks = res.data['chulseoks']
          .map<Chulseok>((json) => Chulseok.fromJson(json))
          .toList();
      return chulseoks;
    } catch (err) {
      return null;
    }
  }
}
