abstract class PositionEvent {}

class InitEvent extends PositionEvent {
  final int level;
  InitEvent(this.level);
}

class NextEvent extends PositionEvent {
  final int level;
  NextEvent(this.level);
}
