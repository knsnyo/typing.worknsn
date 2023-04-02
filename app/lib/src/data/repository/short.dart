import 'package:app/src/data/models/short.dart';
import 'package:dio/dio.dart';

class ShortRepository {
  static String url = 'http://0.0.0.0:5000/shorts';

  static Future<Short> get() async {
    try {
      Response res = await Dio().get<dynamic>(url);
      Short short = Short.fromJson(res.data as Map<String, dynamic>);
      return short;
    } catch (err) {
      throw Exception('DIO ERROR');
    }
  }
}
