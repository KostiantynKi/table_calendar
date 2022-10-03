import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meta/meta.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:table_calendar_example/model/event_model.dart';
import 'package:table_calendar_example/pages/day_screen.dart';
import 'package:table_calendar_example/utils.dart';

part 'calendar_state.dart';

class CalendarCubit extends Cubit<CalendarState> {
  CalendarCubit() : super(CalendarInitial());

  List<Event>? selectedEvents;

  void getData() {
    // List<Event>? selectedEvents;

    selectedEvents = getEventsForDay(DateTime.now()); //! mistake
    //! надо получать данные не для now, а для выбранного дня

    emit(TableCalendarState(selectedEvents));
  }

  List<Event> getEventsForDay(DateTime day) {
    // print("${kEvents[day]} _____________");
    // тут запрашиваю из БД
    return kEvents[day] ?? [Event('Пусто')];
  }

  onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    selectedEvents = getEventsForDay(selectedDay);
    // return selectedDay;
    return selectedEvents;
    // DayScreen(selectedDay: selectedDay);
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //       builder: (context) => DayScreen(
    //           selectedEvents: widget._selectedEvents,
    //           selectedDay: _selectedDay,
    //           updateTableEventsState: _updateTableEventsState)),
    // );
  }
}
