import 'dart:async';
import 'package:app/src/bloc/short/short_bloc.dart';
import 'package:app/src/data/models/short.dart';
import 'package:app/src/data/repository/short_repository.dart';
import 'package:app/src/utils/custom_error.dart';

class ShortViewModel {
  final ShortBloc _shortBloc;
  final ShortRepository _shortRepository;

  ShortViewModel({
    required ShortBloc shortBloc,
    required ShortRepository shortRepository,
  })  : _shortBloc = shortBloc,
        _shortRepository = shortRepository;

  Future<void> init() async {
    try {
      List<Short> list = await _shortRepository.init();
      _shortBloc.add(ShortInitEvent(list: list));
    } catch (err) {
      throw ViewModelError(message: 'ShortViewModel.init()');
    }
  }

  Future<void> next() async {
    try {
      Short next = await _shortRepository.get();
      _shortBloc.add(ShortNextEvent(next: next));
    } catch (err) {
      throw ViewModelError(message: 'ShortViewModel.next()');
    }
  }
}
