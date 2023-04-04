import 'package:app/src/data/models/word.dart';
import 'package:app/src/utils/custom_error.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WordRepository {
  final String url = dotenv.env['WORD_URL']!;

  Future<List<Word>> init() async {
    try {
      Response res = await Dio().get<dynamic>('$url/init');
      List<Word> words = (res.data as List)
          .map<Word>(
              (dynamic json) => Word.fromJson(json as Map<String, dynamic>))
          .toList();
      return words;
    } catch (err) {
      throw CustomDioError(message: 'WordRepository.init()');
    }
  }

  Future<Word> get() async {
    try {
      Response res = await Dio().get<dynamic>(url);
      Word word = Word.fromJson(res.data as Map<String, dynamic>);
      return word;
    } catch (err) {
      throw CustomDioError(message: 'WordRepository.get()');
    }
  }
}
