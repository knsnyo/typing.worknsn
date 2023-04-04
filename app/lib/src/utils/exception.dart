class MyException implements Exception {
  final String message;
  MyException({required this.message});
}

class TokenException extends MyException {
  TokenException({required String message})
      : super(message: 'TOKEN ERROR: $message');
}

class DioException extends MyException {
  DioException({required String message})
      : super(message: 'DIO ERROR: $message');
}

class ViewModelException extends MyException {
  ViewModelException({required String message})
      : super(message: 'VIEW MODEL ERROR: $message');
}
