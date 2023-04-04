import 'dart:async';
import 'package:app/src/bloc/position/position_bloc.dart';
import 'package:app/src/data/models/position.dart';
import 'package:app/src/data/repository/position_repository.dart';
import 'package:app/src/utils/custom_error.dart';

class PositionViewModel {
  final PositionBloc _positionBloc;
  final PositionRepository _positionRepository;

  PositionViewModel({
    required PositionBloc positionBloc,
    required PositionRepository positionRepository,
  })  : _positionBloc = positionBloc,
        _positionRepository = positionRepository;

  Future<void> init(int level) async {
    try {
      List<Position> list = await _positionRepository.init(level);
      _positionBloc.add(PositionInitEvent(list: list));
    } catch (err) {
      throw ViewModelError(message: 'PositionViewModel.init()');
    }
  }

  Future<void> next(int level) async {
    try {
      Position next = await _positionRepository.get(level);
      _positionBloc.add(PositionNextEvent(next: next));
    } catch (err) {
      throw ViewModelError(message: 'PositionViewModel.next()');
    }
  }
}
