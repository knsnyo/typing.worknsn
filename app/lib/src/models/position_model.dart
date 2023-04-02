import 'package:app/src/data/models/position.dart';

class PositionModel {
  int _level = 0;
  Position _current = const Position(letter: '');
  Position _next = const Position(letter: '');

  List<Position> get list => [_current, _next];
  int get level => _level;

  void init(int level, Position current, Position next) {
    _level = level;
    _current = current;
    _next = next;
  }

  void next(Position next) {
    _current = _next;
    _next = next;
  }
}
