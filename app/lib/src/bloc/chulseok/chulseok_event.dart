import 'package:equatable/equatable.dart';

abstract class ChulseokEvent extends Equatable {
  const ChulseokEvent();

  @override
  List<Object> get props => [];
}

class ChulseokLoad extends ChulseokEvent {
  final Map<String, String> tokens;

  ChulseokLoad(this.tokens);

  @override
  List<Object> get props => [tokens];
}
