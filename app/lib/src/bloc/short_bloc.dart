import 'dart:async';
import 'package:app/src/data/models/short.dart';
import 'package:app/src/data/repository/short.dart';

class ShortBloc {
  Short? _current;
  Short? _next;

  final StreamController _shortSubject = StreamController.broadcast();

  Stream get short => _shortSubject.stream;

  void init() async {
    try {
      _current = await ShortRepository.get();
      _next = await ShortRepository.get();
      List<Short?> initList = [_current, _next];
      _shortSubject.sink.add(initList);
    } catch (err) {
      _shortSubject.sink.add([]);
    }
  }

  void next() async {
    try {
      _current = _next;
      _next = await ShortRepository.get();
      List<Short?> initList = [_current, _next];
      _shortSubject.sink.add(initList);
    } catch (err) {
      _shortSubject.sink.add([]);
    }
  }

  void dispose() {
    _shortSubject.close();
  }
}
