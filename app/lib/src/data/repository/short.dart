import 'package:app/src/data/models/short.dart';
import 'package:dio/dio.dart';

class ShortRepository {
  static String url = 'http://0.0.0.0:5000/shorts';

  static Future<Short?> get() async {
    try {
      Response res = await Dio().get(url);
      Short short = Short.fromJson(res.data);
      return short;
    } catch (err) {
      return null;
    }
  }
}
