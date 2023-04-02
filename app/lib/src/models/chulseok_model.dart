import 'package:app/src/data/models/chulseok.dart';

class ChulseokModel {
  List<Chulseok> _chulseok = [];

  List<Chulseok> get chulseok => _chulseok;
  set chulseok(List<Chulseok> chulseok) => _chulseok = chulseok;
}
