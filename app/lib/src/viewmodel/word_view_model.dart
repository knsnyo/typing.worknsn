import 'dart:async';
import 'package:app/src/data/models/word.dart';
import 'package:app/src/data/repository/word.dart';
import 'package:app/src/models/word_model.dart';

class WordViewModel {
  final WordModel _wordModel = WordModel();
  final StreamController<List<Word>> _wordController =
      StreamController<List<Word>>.broadcast();
  Stream<List<Word>> get wordStream => _wordController.stream;

  Future<void> init() async {
    try {
      Word currnet = await WordRepository.get();
      Word next = await WordRepository.get();
      _wordModel.init(currnet, next);
      _wordController.sink.add(_wordModel.list);
    } catch (err) {
      _wordController.sink.addError(err);
    }
  }

  Future<void> next() async {
    try {
      Word next = await WordRepository.get();
      _wordModel.next(next);
      _wordController.sink.add(_wordModel.list);
    } catch (err) {
      _wordController.sink.addError(err);
    }
  }

  void dispose() => _wordController.close();
}
