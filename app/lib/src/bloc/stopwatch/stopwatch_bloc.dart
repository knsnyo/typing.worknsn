import 'package:app/src/models/stopwatch_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'stopwatch_event.dart';

class StopwatchBloc extends Bloc<StopwatchEvent, StopwatchModel> {
  StopwatchBloc()
      : super(StopwatchModel(stopwatch: Stopwatch(), isStart: false)) {
    on<StopwatchResetEvent>(
        (StopwatchResetEvent event, Emitter<StopwatchModel> emit) {
      emit(StopwatchModel(stopwatch: state.stopwatch, isStart: false));
      state.stopwatch.reset();
    });
    on<StopwatchStartEvent>(
        (StopwatchStartEvent event, Emitter<StopwatchModel> emit) {
      emit(StopwatchModel(stopwatch: state.stopwatch, isStart: true));
      state.stopwatch.start();
    });
    on<StopwatchStopEvent>(
        (StopwatchStopEvent event, Emitter<StopwatchModel> emit) {
      (emit(StopwatchModel(stopwatch: state.stopwatch, isStart: false)));
      state.stopwatch.stop();
    });
  }
}
