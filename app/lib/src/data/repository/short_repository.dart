import 'package:app/src/constants/constants.dart';
import 'package:app/src/data/models/short.dart';
import 'package:app/src/utils/custom_error.dart';
import 'package:dio/dio.dart';

class ShortRepository {
  Future<List<Short>> init() async {
    try {
      Response res = await Dio().get<dynamic>('$shortUrl/init');
      List<Short> shorts = (res.data as List)
          .map<Short>(
              (dynamic json) => Short.fromJson(json as Map<String, dynamic>))
          .toList();
      return shorts;
    } catch (err) {
      throw CustomDioError(message: 'DIO ERROR');
    }
  }

  Future<Short> get() async {
    try {
      Response res = await Dio().get<dynamic>(shortUrl);
      Short short = Short.fromJson(res.data as Map<String, dynamic>);
      return short;
    } catch (err) {
      throw CustomDioError(message: 'DIO ERROR');
    }
  }
}
