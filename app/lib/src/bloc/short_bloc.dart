import 'dart:async';
import 'package:app/src/models/short.dart';
import 'package:app/src/repository/short.dart';

class ShortBloc {
  Short? _current;
  Short? _next;

  final StreamController _shortSubject = StreamController.broadcast();

  Stream get short => _shortSubject.stream;

  init() async {
    try {
      _current = await ShortRepository.get();
      _next = await ShortRepository.get();
      List<Short?> initList = [_current, _next];
      _shortSubject.sink.add(initList);
    } catch (err) {
      _shortSubject.sink.add([]);
    }
  }

  next() async {
    try {
      _current = _next;
      _next = await ShortRepository.get();
      List<Short?> initList = [_current, _next];
      _shortSubject.sink.add(initList);
    } catch (err) {
      _shortSubject.sink.add([]);
    }
  }

  dispose() {
    _shortSubject.close();
  }
}
