import 'dart:async';

class CountBloc {
  int _count = 0;
  int _max = 0;
  int _type = 0;

  final StreamController _countSubject = StreamController.broadcast();

  Stream get count => _countSubject.stream;

  void init(int max) {
    _count = 0;
    _type = 0;
    _max = max;
    _countSubject.sink.add(_count);
  }

  int get getCount => _count;
  int get getMax => _max;
  int get getType => _type;

  void increment() {
    _count += 1;
    _countSubject.sink.add(_count);
  }

  void decrement() {
    _count -= 1;
    _countSubject.sink.add(_count);
  }

  void typing(int type) {
    _type += type;
  }

  void dispose() {
    _countSubject.close();
  }
}
