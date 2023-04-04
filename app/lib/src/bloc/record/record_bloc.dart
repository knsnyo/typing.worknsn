import 'package:app/src/models/record_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/src/data/models/record.dart';

part 'record_event.dart';

class RecordBloc extends Bloc<RecordEvent, RecordModel> {
  RecordBloc() : super(RecordModel(list: [])) {
    on<RecordLoadEvent>((RecordLoadEvent event, Emitter<RecordModel> emit) =>
        emit(RecordModel(list: event.list)));
  }
}
