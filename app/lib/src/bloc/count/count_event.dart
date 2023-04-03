part of 'count_bloc.dart';

abstract class CountEvent extends Equatable {
  const CountEvent();

  @override
  List<Object> get props => [];
}

class CountInitEvent extends CountEvent {
  final int max;
  final String category;

  const CountInitEvent(this.max, this.category);

  @override
  List<Object> get props => [max, category];
}

class CountIncrementEvent extends CountEvent {}

class CountDecrementEvent extends CountEvent {}

class CountTotalEvent extends CountEvent {
  final int current;

  const CountTotalEvent(this.current);

  @override
  List<Object> get props => [current];
}
