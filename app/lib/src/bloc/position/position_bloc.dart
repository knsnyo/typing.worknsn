import 'package:app/src/data/repository/position.dart';
import 'package:app/src/models/position_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/src/data/models/position.dart';

part 'position_event.dart';
part 'positon_state.dart';

class PositionBloc extends Bloc<PositionEvent, PositionState> {
  final PositionModel _positionModel = PositionModel();
  final PositionRepository _positionRepository = PositionRepository();

  PositionBloc() : super(InitialPositionState());

  Stream<PositionState> mapEventToState(PositionEvent event) async* {
    if (event is InitialPositionEvent) {
      yield* _mapInitialPositionEventToState(event.level);
    } else if (event is NextPositionEvent) {
      yield* _mapNextPositionEventToState();
    }
  }

  Stream<PositionState> _mapInitialPositionEventToState(int level) async* {
    yield InitialPositionState();
    try {
      Position current = await _positionRepository.get(level);
      Position next = await _positionRepository.get(level);
      _positionModel.init(level, current, next);
      yield LoadedPositionState(_positionModel.list);
    } catch (err) {
      yield ErrorPositionState();
    }
  }

  Stream<PositionState> _mapNextPositionEventToState() async* {
    yield InitialPositionState();
    try {
      Position next = await _positionRepository.get(_positionModel.level);
      _positionModel.next(next);
      yield LoadedPositionState(_positionModel.list);
    } catch (err) {
      yield ErrorPositionState();
    }
  }
}
