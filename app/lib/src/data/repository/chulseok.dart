import 'package:app/src/data/models/chulseok.dart';
import 'package:dio/dio.dart';

class ChulseokRepository {
  static String url = 'http://0.0.0.0:5000/info/chulseoks';

  static Future<List<Chulseok>> getList(Map<String, String> tokens) async {
    try {
      List<Chulseok> chulseoks = [];
      Response res = await Dio(BaseOptions(headers: tokens)).get<dynamic>(url);
      if (null != res.data['chulseoks']) {
        chulseoks = (res.data['chulseoks'] as List)
            .map<Chulseok>((dynamic json) =>
                Chulseok.fromJson(json as Map<String, dynamic>))
            .toList();
      }
      return chulseoks;
    } catch (err) {
      throw Exception('DIO ERROR');
    }
  }
}
