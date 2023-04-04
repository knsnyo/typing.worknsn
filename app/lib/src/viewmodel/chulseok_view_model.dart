import 'dart:async';
import 'package:app/src/bloc/chulseok/chulseok_bloc.dart';
import 'package:app/src/data/models/chulseok.dart';
import 'package:app/src/data/repository/chulseok_repository.dart';
import 'package:app/src/storage/storage.dart';
import 'package:app/src/utils/custom_error.dart';

class ChulseokViewModel {
  final ChulseokBloc _chulseokBloc;
  final ChulseokRepository _chulseokRepository;

  ChulseokViewModel({
    required ChulseokBloc chulseokBloc,
    required ChulseokRepository chulseokRepository,
  })  : _chulseokBloc = chulseokBloc,
        _chulseokRepository = chulseokRepository;

  Future<void> get() async {
    try {
      await checkTokens();
      Map<String, String> tokens = await getTokens();
      List<Chulseok> list = await _chulseokRepository.get(tokens);
      _chulseokBloc.add(ChulseokLoadEvent(list: list));
    } catch (err) {
      _chulseokBloc.add(ChulseokLoadEvent(list: []));
      throw ViewModelError(message: 'ChulseokViewModel.get()');
    }
  }
}
