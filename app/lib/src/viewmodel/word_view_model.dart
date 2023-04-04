import 'dart:async';
import 'package:app/src/bloc/word/word_bloc.dart';
import 'package:app/src/data/models/word.dart';
import 'package:app/src/data/repository/word_repository.dart';
import 'package:app/src/utils/custom_error.dart';

class WordViewModel {
  final WordBloc _wordBloc;
  final WordRepository _wordRepository;

  WordViewModel({
    required WordBloc wordBloc,
    required WordRepository wordRepository,
  })  : _wordBloc = wordBloc,
        _wordRepository = wordRepository;

  Future<void> init() async {
    try {
      List<Word> list = await _wordRepository.init();
      _wordBloc.add(WordInitEvent(list: list));
    } catch (err) {
      throw ViewModelError(message: 'WordViewModel.init()');
    }
  }

  Future<void> next() async {
    try {
      Word next = await _wordRepository.get();
      _wordBloc.add(WordNextEvent(next: next));
    } catch (err) {
      throw ViewModelError(message: 'WordViewModel.next()');
    }
  }
}
