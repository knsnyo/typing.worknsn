import 'dart:async';

class TimeBloc {
  DateTime? _start;
  DateTime? _end;
  String? _time;

  final StreamController _timeSubject = StreamController.broadcast();

  Stream get time => _timeSubject.stream;

  init() {
    _start = DateTime.now();
    _end = DateTime.now();
  }

  dispose() {
    _timeSubject.close();
  }
}
