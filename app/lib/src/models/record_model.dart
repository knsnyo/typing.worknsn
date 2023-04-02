import 'package:app/src/data/models/record.dart';

class RecordModel {
  List<Record> _record = [];

  List<Record> get record => _record;
  set record(List<Record> record) => _record = record;
}
