import 'package:app/src/data/models/word.dart';
import 'package:app/src/models/word_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'word_event.dart';

class WordBloc extends Bloc<WordEvent, WordModel> {
  WordBloc() : super(WordModel(list: const [Word(word: ''), Word(word: '')])) {
    on<WordInitEvent>((WordInitEvent event, Emitter<WordModel> emit) =>
        emit(WordModel(list: event.list)));
    on<WordNextEvent>((WordNextEvent event, Emitter<WordModel> emit) =>
        emit(WordModel(list: [state.list[1], event.next])));
  }
}
