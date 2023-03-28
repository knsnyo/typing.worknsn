import 'dart:async';
import 'package:app/src/models/position.dart';
import 'package:app/src/repository/position.dart';

class PositionBloc {
  int _level = 0;
  Position? _current;
  Position? _next;

  final StreamController _positionSubject = StreamController.broadcast();

  Stream get position => _positionSubject.stream;

  void init(int level) async {
    try {
      _level = level;
      _current = await PositionRepository.get(level);
      _next = await PositionRepository.get(level);
      List<Position?> initList = [_current, _next];
      _positionSubject.sink.add(initList);
    } catch (err) {
      _positionSubject.sink.add([]);
    }
  }

  void next() async {
    try {
      _current = _next;
      _next = await PositionRepository.get(_level);
      List<Position?> initList = [_current, _next];
      _positionSubject.sink.add(initList);
    } catch (err) {
      _positionSubject.sink.add([]);
    }
  }

  void dispose() {
    _positionSubject.close();
  }
}
