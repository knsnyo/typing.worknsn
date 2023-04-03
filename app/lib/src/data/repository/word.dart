import 'package:app/src/data/models/word.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WordRepository {
  static final String url = dotenv.env['WORD_URL']!;

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
