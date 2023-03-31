import 'dart:async';
import 'package:app/src/data/models/chulseok.dart';
import 'package:app/src/data/repository/chulseok.dart';

class ChulseokBloc {
  List<Chulseok>? _chulseok;

  final StreamController _chulseokSubject = StreamController.broadcast();

  Stream get chulseok => _chulseokSubject.stream;

  void init() async {
    _chulseok = [];
    _chulseokSubject.sink.add(_chulseok);
  }

  Future<void> getList() async {
    try {
      _chulseok = await ChulseokRepository.getList();
    } catch (err) {
      _chulseok = [];
    } finally {
      if (!_chulseokSubject.isClosed) {
        _chulseokSubject.sink.add(_chulseok);
      }
    }
  }

  void dispose() {
    _chulseokSubject.close();
  }
}
