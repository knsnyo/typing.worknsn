part of 'record_bloc.dart';

abstract class RecordEvent {}

class RecordLoadEvent extends RecordEvent {
  List<Record> list;
  RecordLoadEvent({required this.list});
}
