part of 'position_bloc.dart';

abstract class PositionEvent {}

class InitialPositionEvent extends PositionEvent {
  final int level;
  InitialPositionEvent(this.level);
}

class NextPositionEvent extends PositionEvent {
  NextPositionEvent();
}
