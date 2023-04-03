import 'package:app/src/data/models/short.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ShortRepository {
  static final String url = dotenv.env['SHORT_URL']!;

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
