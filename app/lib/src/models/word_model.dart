import 'package:app/src/data/models/word.dart';

class WordModel {
  Word _current = const Word(word: '');
  Word _next = const Word(word: '');

  List<Word> get list => [_current, _next];

  void init(Word current, Word next) {
    _current = current;
    _next = next;
  }

  void next(Word next) {
    _current = _next;
    _next = next;
  }
}
