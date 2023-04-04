import 'package:app/src/data/models/record.dart';
import 'package:app/src/utils/custom_error.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class RecordRepository {
  final String url = dotenv.env['RECORD_URL']!;

  Future<Response> insert(Map<String, dynamic> tokens, int speed) async {
    try {
      Response res = await Dio(BaseOptions(headers: tokens))
          .post<dynamic>(url, data: {'speed': speed});
      return res;
    } catch (err) {
      throw CustomDioError(message: 'RecordRepository.auto()');
    }
  }

  Future<List<Record>> get(Map<String, String> tokens) async {
    try {
      Response res = await Dio(BaseOptions(headers: tokens)).get<dynamic>(url);
      List<Record> records = (res.data['record'] as List<Record>)
          .map<Record>((json) => Record.fromJson(json as Map<String, dynamic>))
          .toList();
      return records;
    } catch (err) {
      throw CustomDioError(message: 'RecordRepository.get()');
    }
  }
}
