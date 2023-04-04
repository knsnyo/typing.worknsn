import 'package:app/src/bloc/chulseok/chulseok_bloc.dart';
import 'package:app/src/data/models/chulseok.dart';
import 'package:app/src/data/repository/chulseok_repository.dart';
import 'package:app/src/models/chulseok_model.dart';
import 'package:app/src/viewmodel/chulseok_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

class Challenge extends StatelessWidget {
  const Challenge({super.key});

  @override
  Widget build(BuildContext context) {
    ChulseokRepository chulseokRepository = ChulseokRepository();
    ChulseokViewModel chulseokViewModel = ChulseokViewModel(
      chulseokBloc: BlocProvider.of<ChulseokBloc>(context),
      chulseokRepository: chulseokRepository,
    );
    chulseokViewModel.get();
    return BlocBuilder<ChulseokBloc, ChulseokModel>(
      builder: (BuildContext context, ChulseokModel state) {
        if (state.list.isNotEmpty) {
          Map<DateTime, List<String>> check = _formatting(state.list);
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              TableCalendar<dynamic>(
                focusedDay: DateTime.now(),
                firstDay: DateTime.utc(2023, 1, 1),
                lastDay: DateTime.now(),
                headerStyle: const HeaderStyle(
                  titleCentered: true,
                  formatButtonVisible: false,
                ),
                eventLoader: (day) => _getEventForDay(check, day),
                calendarStyle: const CalendarStyle(
                  markerSize: 40,
                  markersAnchor: 1,
                  isTodayHighlighted: false,
                  markersAutoAligned: true,
                  markersAlignment: Alignment.center,
                  markerDecoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/image/marker.png'),
                    ),
                  ),
                ),
              )
            ],
          );
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            TableCalendar<dynamic>(
              focusedDay: DateTime.now(),
              firstDay: DateTime.utc(2023, 1, 1),
              lastDay: DateTime.now(),
              headerStyle: const HeaderStyle(
                titleCentered: true,
                formatButtonVisible: false,
              ),
              calendarStyle: const CalendarStyle(
                isTodayHighlighted: false,
              ),
            )
          ],
        );
      },
    );
  }

  Map<DateTime, List<String>> _formatting(List<Chulseok>? data) {
    int loop = data?.length ?? 0;
    Map<DateTime, List<String>> result = {};
    for (int i = 0; i < loop; i += 1) {
      DateTime sqlDate = data![i].date;
      DateTime customDate = DateTime(sqlDate.year, sqlDate.month, sqlDate.day)
          .add(const Duration(days: 1));
      result.putIfAbsent(customDate, () => ['FINISH']);
    }
    return result;
  }

  List<String> _getEventForDay(Map<DateTime, List<String>> data, DateTime day) {
    DateTime searchDate = DateTime(day.year, day.month, day.day);
    return data[searchDate] ?? [];
  }
}
