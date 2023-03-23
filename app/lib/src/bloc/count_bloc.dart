import 'dart:async';

class CountBloc {
  int _count = 0;

  final StreamController _countSubject = StreamController.broadcast();

  Stream get count => _countSubject.stream;

  init() {
    _count = 0;
    _countSubject.sink.add(_count);
  }

  int getCounter() => _count;

  increment() {
    _count += 1;
    _countSubject.sink.add(_count);
  }

  decrement() {
    _count -= 1;
    _countSubject.sink.add(_count);
  }

  dispose() {
    _countSubject.close();
  }
}
