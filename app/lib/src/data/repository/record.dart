import 'package:app/src/data/models/record.dart';
import 'package:app/src/storage/storage.dart';
import 'package:dio/dio.dart';

class RecordRepository {
  static String url = 'http://0.0.0.0:5000/info/records';

  static Future<Response?> insert(int speed) async {
    try {
      Map<String, String> tokens = await getTokens();
      Response res = await Dio(BaseOptions(headers: tokens))
          .post(url, data: {'speed': speed});
      if (null != res.data['accessToken']) {
        await setAccessToken(res.data['accessToken']);
        tokens = await getTokens();
      }
      return res;
    } catch (err) {
      return null;
    }
  }

  static Future<List<Record>?> getInfo() async {
    try {
      Map<String, String> tokens = await getTokens();
      Response res = await Dio(BaseOptions(headers: tokens)).get(url);
      List<Record> records = res.data['record']
          .map<Record>((json) => Record.fromJson(json))
          .toList();
      return records;
    } catch (err) {
      return null;
    }
  }
}