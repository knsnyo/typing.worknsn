import 'dart:async';
import 'package:app/src/data/models/record.dart';
import 'package:app/src/data/repository/record.dart';
import 'package:app/src/models/record_model.dart';
import 'package:app/src/storage/storage.dart';
import 'package:dio/dio.dart';

class RecordViewModel {
  final RecordModel _recordModel = RecordModel();
  final StreamController<List<Record>> _recordController =
      StreamController<List<Record>>.broadcast();
  Stream<List<Record>> get recordStream => _recordController.stream;

  Future<Response> insert(int speed) async {
    await checkTokens();
    Map<String, String> tokens = await getTokens();
    Response res = await RecordRepository.insert(tokens, speed);
    if (null != res.data['accessToken']) {
      String accessToken = res.data['accessToken'] as String;
      await setAccessToken(accessToken);
    }
    return res;
  }

  Future<void> getInfo() async {
    try {
      await checkTokens();
      Map<String, String> tokens = await getTokens();
      List<Record> record = await RecordRepository.getInfo(tokens);
      _recordModel.record = record;
      _recordController.sink.add(_recordModel.record);
    } catch (err) {
      _recordController.sink.addError(err);
    }
  }

  void dispose() => _recordController.close();
}
