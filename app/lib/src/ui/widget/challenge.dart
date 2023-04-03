import 'package:app/src/data/models/chulseok.dart';
import 'package:app/src/viewmodel/chulseok_view_model.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

late ChulseokViewModel chulseokViewModel;

class Challenge extends StatefulWidget {
  const Challenge({super.key});

  @override
  State<Challenge> createState() => _ChallengeState();
}

class _ChallengeState extends State<Challenge> {
  @override
  void initState() {
    super.initState();
    chulseokViewModel = ChulseokViewModel();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    chulseokViewModel.getList();
  }

  @override
  void dispose() {
    super.dispose();
    chulseokViewModel.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: chulseokViewModel.chulseokStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
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
                calendarStyle: const CalendarStyle(isTodayHighlighted: false),
              )
            ],
          );
        }
        Map<DateTime, List<String>> check =
            _formatting(snapshot.data as List<Chulseok>);
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
                    image: AssetImage('assets/marker.png'),
                  ),
                ),
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

/// https://velog.io/@jun7332568/%ED%94%8C%EB%9F%AC%ED%84%B0flutter-%EB%8B%AC%EB%A0%A5-Event-%EA%B5%AC%ED%98%84%ED%95%B4%EB%B3%B4%EA%B8%B0-Tablecalendar-%EB%9D%BC%EC%9D%B4%EB%B8%8C%EB%9F%AC%EB%A6%AC