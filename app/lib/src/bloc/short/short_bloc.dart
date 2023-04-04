import 'package:app/src/data/models/short.dart';
import 'package:app/src/models/short_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'short_event.dart';

class ShortBloc extends Bloc<ShortEvent, ShortModel> {
  ShortBloc()
      : super(ShortModel(list: const [
          Short(name: '', short: ''),
          Short(name: '', short: '')
        ])) {
    on<ShortInitEvent>((ShortInitEvent event, Emitter<ShortModel> emit) =>
        emit(ShortModel(list: event.list)));
    on<ShortNextEvent>((ShortNextEvent event, Emitter<ShortModel> emit) =>
        emit(ShortModel(list: [state.list[1], event.next])));
  }
}
