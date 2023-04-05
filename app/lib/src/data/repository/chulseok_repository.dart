import 'package:app/src/constants/constants.dart';
import 'package:app/src/data/models/chulseok.dart';
import 'package:app/src/utils/custom_error.dart';
import 'package:dio/dio.dart';

class ChulseokRepository {
  Future<List<Chulseok>> get(Map<String, String> tokens) async {
    try {
      List<Chulseok> chulseoks = [];
      Response res =
          await Dio(BaseOptions(headers: tokens)).get<dynamic>(chulseokUrl);
      if (null != res.data['chulseoks']) {
        chulseoks = (res.data['chulseoks'] as List)
            .map<Chulseok>((dynamic json) =>
                Chulseok.fromJson(json as Map<String, dynamic>))
            .toList();
      }
      return chulseoks;
    } catch (err) {
      throw CustomDioError(message: 'ChulseokRepository.get()');
    }
  }
}
