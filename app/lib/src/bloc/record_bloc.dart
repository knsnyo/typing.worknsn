import 'dart:async';
import 'package:app/src/models/record.dart';
import 'package:app/src/repository/record.dart';

class RecordBloc {
  List<Record>? _record;

  final StreamController _recordSubject = StreamController.broadcast();

  Stream get record => _recordSubject.stream;

  Future<void> insert(int speed) async {
    await RecordRepository.insert(speed);
  }

  Future<void> getInfo() async {
    try {
      _record = await RecordRepository.getInfo();
    } catch (err) {
      _record = [];
    } finally {
      _recordSubject.sink.add(_record);
    }
  }

  void dispose() {
    _recordSubject.close();
  }
}
