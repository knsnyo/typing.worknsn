part of 'stopwatch_bloc.dart';

abstract class StopwatchEvent {}

class StopwatchResetEvent extends StopwatchEvent {}

class StopwatchStartEvent extends StopwatchEvent {}

class StopwatchStopEvent extends StopwatchEvent {}
