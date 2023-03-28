import 'package:app/src/repository/record.dart';

class RecordBloc {
  void insert(int speed) async {
    await RecordRepository.insert(speed);
  }

  void getInfo() async {
    await RecordRepository.getInfo();
  }
}
