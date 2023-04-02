import 'dart:async';
import 'package:app/src/models/count_model.dart';

class CountViewModel {
  final CountModel _countModel = CountModel();
  final StreamController<int> _countController =
      StreamController<int>.broadcast();
  Stream<int> get countStream => _countController.stream;

  void init(int max, String category) {
    _countModel.maximum = max;
    _countModel.mode = category;
    _countController.sink.add(_countModel.count);
  }

  int get count => _countModel.count;
  int get max => _countModel.max;
  int get type => _countModel.total;
  String get category => _countModel.category;

  set increment(dynamic _) {
    _countModel.increment = null;
    _countController.sink.add(_countModel.count);
  }

  set decrement(dynamic _) {
    _countModel.decrement = null;
    _countController.sink.add(_countModel.count);
  }

  set total(int current) => _countModel.total = current;

  bool isMax() => _countModel.max == _countModel.count;
  void dispose() => _countController.close();
}
