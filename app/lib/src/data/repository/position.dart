import 'package:app/src/data/models/position.dart';
import 'package:dio/dio.dart';

class PositionRepository {
  static String url = 'http://0.0.0.0:5000/positions/';

  static Future<Position> get(int level) async {
    try {
      Response res = await Dio().get<dynamic>('$url$level');
      Position position = Position.fromJson(res.data as Map<String, dynamic>);
      return position;
    } catch (err) {
      throw Exception('DIO ERROR');
    }
  }
}
