import 'package:app/src/data/models/chulseok.dart';
import 'package:equatable/equatable.dart';

abstract class ChulseokState extends Equatable {
  const ChulseokState();

  @override
  List<Object> get props => [];
}

class ChulseokInitial extends ChulseokState {}

class ChulseokLoading extends ChulseokState {}

class ChulseokLoadSuccess extends ChulseokState {
  final List<Chulseok> chulseok;

  ChulseokLoadSuccess(this.chulseok);

  @override
  List<Object> get props => [chulseok];
}

class ChulseokLoadFailure extends ChulseokState {
  final String error;

  ChulseokLoadFailure(this.error);

  @override
  List<Object> get props => [error];
}
