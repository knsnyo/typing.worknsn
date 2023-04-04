import 'dart:async';
import 'package:app/src/bloc/record/record_bloc.dart';
import 'package:app/src/data/models/record.dart';
import 'package:app/src/data/repository/record_repository.dart';
import 'package:app/src/storage/storage.dart';
import 'package:app/src/utils/custom_error.dart';
import 'package:dio/dio.dart';

class RecordViewModel {
  final RecordBloc _recordBloc;
  final RecordRepository _recordRepository;

  RecordViewModel({
    required RecordBloc recordBloc,
    required RecordRepository recordRepository,
  })  : _recordBloc = recordBloc,
        _recordRepository = recordRepository;

  Future<Response> insert(int speed) async {
    await checkTokens();
    Map<String, String> tokens = await getTokens();
    Response res = await _recordRepository.insert(tokens, speed);
    if (null != res.data['accessToken']) {
      String accessToken = res.data['accessToken'] as String;
      await setAccessToken(accessToken);
    }
    return res;
  }

  Future<void> get() async {
    try {
      await checkTokens();
      Map<String, String> tokens = await getTokens();
      List<Record> list = await _recordRepository.get(tokens);
      _recordBloc.add(RecordLoadEvent(list: list));
    } catch (err) {
      throw ViewModelError(message: 'RecordViewModel.get()');
    }
  }
}
