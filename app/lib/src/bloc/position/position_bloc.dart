import 'package:app/src/data/models/position.dart';
import 'package:app/src/models/position_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'position_event.dart';

class PositionBloc extends Bloc<PositionEvent, PositionModel> {
  PositionBloc() : super(PositionModel(list: [])) {
    on<PositionInitEvent>(
        (PositionInitEvent event, Emitter<PositionModel> emit) =>
            emit(PositionModel(list: event.list)));
    on<PositionNextEvent>(
        (PositionNextEvent event, Emitter<PositionModel> emit) =>
            emit(PositionModel(list: [state.list[1], event.next])));
  }
}
