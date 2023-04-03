import 'package:app/src/data/models/record.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class RecordRepository {
  static final String url = dotenv.env['RECORD_URL']!;

  static Future<Response> insert(Map<String, dynamic> tokens, int speed) async {
    try {
      Response res = await Dio(BaseOptions(headers: tokens))
          .post<dynamic>(url, data: {'speed': speed});
      return res;
    } catch (err) {
      throw Exception('DIO ERROR');
    }
  }

  static Future<List<Record>> getInfo(Map<String, String> tokens) async {
    try {
      Response res = await Dio(BaseOptions(headers: tokens)).get<dynamic>(url);
      List<Record> records = (res.data['record'] as List<Record>)
          .map<Record>((json) => Record.fromJson(json as Map<String, dynamic>))
          .toList();
      return records;
    } catch (err) {
      throw Exception('DIO ERROR');
    }
  }
}
