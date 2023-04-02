import 'package:app/src/data/models/short.dart';

class ShortModel {
  Short _current = const Short(name: '', short: '');
  Short _next = const Short(name: '', short: '');
  List<Short> get list => [_current, _next];

  void init(Short current, Short next) {
    _current = current;
    _next = next;
  }

  void next(Short next) {
    _current = _next;
    _next = next;
  }
}
