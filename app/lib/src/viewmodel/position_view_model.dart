import 'dart:async';
import 'package:app/src/data/models/position.dart';
import 'package:app/src/data/repository/position.dart';
import 'package:app/src/models/position_model.dart';

class PositionViewModel {
  final PositionModel _positionModel = PositionModel();
  final StreamController<List<Position>> _positionController =
      StreamController<List<Position>>.broadcast();
  Stream<List<Position>> get positionStream => _positionController.stream;

  Future<void> init(int level) async {
    try {
      Position current = await PositionRepository.get(level);
      Position next = await PositionRepository.get(level);
      _positionModel.init(level, current, next);
      _positionController.sink.add(_positionModel.list);
    } catch (err) {
      _positionController.sink.addError(err);
    }
  }

  Future<void> next() async {
    try {
      Position next = await PositionRepository.get(_positionModel.level);
      _positionModel.next(next);
      _positionController.sink.add(_positionModel.list);
    } catch (err) {
      _positionController.sink.addError(err);
    }
  }

  void dispose() => _positionController.close();
}
