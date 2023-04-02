import 'package:app/src/data/models/word.dart';
import 'package:dio/dio.dart';

class WordRepository {
  static String url = 'http://0.0.0.0:5000/words';
  static Future<Word> get() async {
    try {
      Response res = await Dio().get<dynamic>(url);
      Word word = Word.fromJson(res.data as Map<String, dynamic>);
      return word;
    } catch (err) {
      throw Exception('DIO ERROR');
    }
  }
}
