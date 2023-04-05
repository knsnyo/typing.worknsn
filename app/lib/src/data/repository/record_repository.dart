import 'package:app/src/constants/constants.dart';
import 'package:app/src/data/models/record.dart';
import 'package:app/src/utils/custom_error.dart';
import 'package:dio/dio.dart';

class RecordRepository {
  Future<Response> insert(Map<String, dynamic> tokens, int speed) async {
    try {
      Response res = await Dio(BaseOptions(headers: tokens))
          .post<dynamic>(recordUrl, data: {'speed': speed});
      return res;
    } catch (err) {
      throw CustomDioError(message: 'RecordRepository.auto()');
    }
  }

  Future<List<Record>> get(Map<String, String> tokens) async {
    try {
      Response res =
          await Dio(BaseOptions(headers: tokens)).get<dynamic>(recordUrl);
      List<Record> records = (res.data['record'] as List<Record>)
          .map<Record>((json) => Record.fromJson(json as Map<String, dynamic>))
          .toList();
      return records;
    } catch (err) {
      throw CustomDioError(message: 'RecordRepository.get()');
    }
  }
}
