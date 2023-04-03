part of 'count_bloc.dart';

abstract class CountState extends Equatable {
  const CountState();

  @override
  List<Object> get props => [];
}

class CountInitial extends CountState {}

class CountLoading extends CountState {}

class CountLoadSuccess extends CountState {
  final int count;

  const CountLoadSuccess(this.count);

  @override
  List<Object> get props => [count];
}

class CountLoadFailure extends CountState {
  final String errorMessage;

  const CountLoadFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
