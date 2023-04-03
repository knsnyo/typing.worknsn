import 'dart:async';
import 'package:app/src/data/models/chulseok.dart';
import 'package:app/src/data/repository/chulseok.dart';
import 'package:app/src/models/chulseok_model.dart';
import 'package:app/src/storage/storage.dart';

class ChulseokViewModel {
  final ChulseokModel _chulseokModel = ChulseokModel();
  final StreamController<List<Chulseok>> _chulseokController =
      StreamController<List<Chulseok>>.broadcast();
  Stream<List<Chulseok>> get chulseokStream => _chulseokController.stream;

  void init() => _chulseokController.sink.add(_chulseokModel.chulseok);

  Future<void> getList() async {
    try {
      // await checkTokens();
      Map<String, String> tokens = await getTokens();
      List<Chulseok> chulseok = await ChulseokRepository.getList(tokens);
      _chulseokModel.chulseok = chulseok;
      _chulseokController.sink.add(_chulseokModel.chulseok);
    } catch (err) {
      _chulseokController.sink.addError(err);
    }
  }

  void dispose() => _chulseokController.close();
}
