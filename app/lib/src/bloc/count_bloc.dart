import 'dart:async';

class CountBloc {
  int _count = 0;
  int _max = 0;

  final StreamController _countSubject = StreamController.broadcast();

  Stream get count => _countSubject.stream;

  init(int max) {
    _count = 0;
    _max = max;
    _countSubject.sink.add(_count);
  }

  int get getCount => _count;
  int get getMax => _max;

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
