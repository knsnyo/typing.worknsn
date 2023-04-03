import 'dart:async';
import 'package:app/src/models/count_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'count_event.dart';
part 'count_state.dart';

class CountBloc extends Bloc<CountEvent, CountState> {
  final CountModel _countModel = CountModel();
  final StreamController<int> _countController =
      StreamController<int>.broadcast();
  Stream<int> get countStream => _countController.stream;

  CountBloc() : super(CountInitial()) {
    on<CountInitEvent>((CountInitEvent event, Emitter<CountState> emit) {
      _countModel.maximum = event.max;
      _countModel.mode = event.category;
      emit(CountLoadSuccess(_countModel.count));
    });

    on<CountIncrementEvent>(
        (CountIncrementEvent event, Emitter<CountState> emit) {
      _countModel.increment = null;
      _countController.sink.add(_countModel.count);
      emit(CountLoadSuccess(_countModel.count));
    });

    on<CountDecrementEvent>(
        (CountDecrementEvent event, Emitter<CountState> emit) {
      _countModel.decrement = null;
      _countController.sink.add(_countModel.count);
      emit(CountLoadSuccess(_countModel.count));
    });

    on<CountTotalEvent>((CountTotalEvent event, Emitter<CountState> emit) {
      _countModel.total = event.current;
      _countController.sink.add(_countModel.count);
      emit(CountLoadSuccess(_countModel.count));
    });
  }

  void dispose() => _countController.close();
}
