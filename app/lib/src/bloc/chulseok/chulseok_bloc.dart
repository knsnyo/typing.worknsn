import 'package:app/src/bloc/chulseok/chulseok.state.dart';
import 'package:app/src/bloc/chulseok/chulseok_event.dart';
import 'package:app/src/data/models/chulseok.dart';
import 'package:app/src/data/repository/chulseok.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChulseokBloc extends Bloc<ChulseokEvent, ChulseokState> {
  ChulseokBloc() : super(ChulseokInitial());

  Stream<ChulseokState> mapEventToState(ChulseokEvent event) async* {
    if (event is ChulseokLoad) {
      yield ChulseokLoading();
      try {
        List<Chulseok> chulseok =
            await ChulseokRepository.getList(event.tokens);
        yield ChulseokLoadSuccess(chulseok);
      } catch (err) {
        yield ChulseokLoadFailure(err.toString());
      }
    }
  }
}
