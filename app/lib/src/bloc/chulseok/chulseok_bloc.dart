import 'package:app/src/models/chulseok_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/src/data/models/chulseok.dart';

part 'chulseok_event.dart';

class ChulseokBloc extends Bloc<ChulseokEvent, ChulseokModel> {
  ChulseokBloc() : super(ChulseokModel(list: [])) {
    on<ChulseokLoadEvent>(
        (ChulseokLoadEvent event, Emitter<ChulseokModel> emit) =>
            emit(ChulseokModel(list: event.list)));
  }
}
