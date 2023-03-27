import 'package:app/src/models/word.dart';
import 'package:dio/dio.dart';

class WordRepository {
  static String url = 'http://0.0.0.0:5000/words';
  static Future<Word?> get() async {
    try {
      Response res = await Dio().get(url);
      Word word = Word.fromJson(res.data);
      return word;
    } catch (err) {
      return null;
    }
  }
}
