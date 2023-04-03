import 'dart:async';
import 'package:app/src/bloc/position/position_bloc.dart';
import 'package:app/src/data/models/position.dart';
import 'package:app/src/data/repository/position.dart';
import 'package:app/src/models/position_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PositionViewModel {
  final PositionModel _positionModel = PositionModel();
  final StreamController<List<Position>> _positionController =
      StreamController<List<Position>>.broadcast();
  Stream<List<Position>> get positionStream => _positionController.stream;
  final PositionRepository _positionRepository = PositionRepository();
  late PositionBloc positionBloc;

  PositionViewModel(BuildContext context) {
    positionBloc = BlocProvider.of<PositionBloc>(context);
  }

  Future<void> init(int level) async {
    try {
      Position current = await _positionRepository.get(level);
      Position next = await _positionRepository.get(level);
      _positionModel.init(level, current, next);
      _positionController.sink.add(_positionModel.list);
    } catch (err) {
      _positionController.sink.addError(err);
    }
  }

  Future<void> next() async {
    try {
      Position next = await _positionRepository.get(_positionModel.level);
      _positionModel.next(next);
      _positionController.sink.add(_positionModel.list);
    } catch (err) {
      _positionController.sink.addError(err);
    }
  }

  void dispose() => _positionController.close();
}
