import 'dart:async';
import 'package:app/src/data/models/word.dart';
import 'package:app/src/data/repository/word.dart';

class WordBloc {
  Word? _current;
  Word? _next;

  final StreamController _wordSubject = StreamController.broadcast();

  Stream get word => _wordSubject.stream;

  void init() async {
    try {
      _current = await WordRepository.get();
      _next = await WordRepository.get();
      List<Word?> initList = [_current, _next];
      _wordSubject.sink.add(initList);
    } catch (err) {
      _wordSubject.sink.add([]);
    }
  }

  void next() async {
    try {
      _current = _next;
      _next = await WordRepository.get();
      List<Word?> initList = [_current, _next];
      _wordSubject.sink.add(initList);
    } catch (err) {
      _wordSubject.sink.add([]);
    }
  }

  void dispose() {
    _wordSubject.close();
  }
}
