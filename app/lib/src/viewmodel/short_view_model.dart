import 'dart:async';
import 'package:app/src/data/models/short.dart';
import 'package:app/src/data/repository/short.dart';
import 'package:app/src/models/short_model.dart';

class ShortViewModel {
  final ShortModel _shortModel = ShortModel();
  final StreamController<List<Short>> _shortController =
      StreamController<List<Short>>.broadcast();
  Stream<List<Short>> get shortStream => _shortController.stream;

  Future<void> init() async {
    try {
      Short current = await ShortRepository.get();
      Short next = await ShortRepository.get();
      _shortModel.init(current, next);
      _shortController.sink.add(_shortModel.list);
    } catch (err) {
      _shortController.sink.addError(err);
    }
  }

  Future<void> next() async {
    try {
      Short next = await ShortRepository.get();
      _shortModel.next(next);
      _shortController.sink.add(_shortModel.list);
    } catch (err) {
      _shortController.sink.addError(err);
    }
  }

  void dispose() => _shortController.close();
}
