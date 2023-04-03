part of 'position_bloc.dart';

abstract class PositionState {}

class InitialPositionState extends PositionState {}

class LoadingPositionState extends PositionState {}

class ErrorPositionState extends PositionState {}

class LoadedPositionState extends PositionState {
  final List<Position> positions;
  LoadedPositionState(this.positions);
}
