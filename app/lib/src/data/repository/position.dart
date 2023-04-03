import 'package:app/src/data/models/position.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class PositionRepository {
  final String url = dotenv.env['POSITION_URL']!;

  Future<Position> get(int level) async {
    try {
      Response res = await Dio().get<dynamic>('$url/$level');
      Position position = Position.fromJson(res.data as Map<String, dynamic>);
      return position;
    } catch (err) {
      throw Exception('DIO ERROR');
    }
  }
}
