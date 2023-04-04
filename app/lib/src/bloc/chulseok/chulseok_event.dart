part of 'chulseok_bloc.dart';

abstract class ChulseokEvent {}

class ChulseokLoadEvent extends ChulseokEvent {
  List<Chulseok> list;
  ChulseokLoadEvent({required this.list});
}
