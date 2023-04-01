import 'package:app/src/data/models/position.dart';

abstract class PositionState {
  Position? current;
  Position? next;
  PositionState({this.current, this.next});
}

class InitialPositionState extends PositionState {
  InitialPositionState() : super();
}

class LoadingPositionState extends PositionState {
  LoadingPositionState() : super();
}

class SuccessPositionState extends PositionState {
  SuccessPositionState(Position current, Position next)
      : super(current: current, next: next);

  Position get nextPosition => next!;
}

class FailurePositionState extends PositionState {
  FailurePositionState() : super();
}
