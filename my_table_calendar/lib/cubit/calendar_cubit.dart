import 'dart:collection';

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

  // List<Event>? selectedEvents;

  void getStart() {
    emit(TableCalendarState(state.selectedEvents));
  }

  List<Event> getEventsForTheDay(DateTime day) {
    int getHashCode(DateTime key) {
      return key.day * 1000000 + key.month * 10000 + key.year;
    }

    final kToday = DateTime.now();

    Map<DateTime, List<Event>> myMap = {
      DateTime(kToday.year, kToday.month, kToday.day + 1): [
        Event('Some task 2'),
        Event('Some task 3'),
        Event('Some task 4'),
        Event('Some task 5'),
        Event('Some task 6'),
      ],
      DateTime(kToday.year, kToday.month, kToday.day + 2): [
        Event('Some task 9')
      ],
      DateTime(kToday.year, kToday.month - 1, kToday.day + 12): [
        Event('Some task 10')
      ],
      DateTime(kToday.year, kToday.month - 1, kToday.day + 16): [
        Event('Some task 11'),
        Event('Some task 12'),
        Event('Some task 13')
      ],
      DateTime(kToday.year, kToday.month, kToday.day - 3): [
        Event('Some task 14'),
        Event('Some task 15'),
      ],
    };

    final kEvents = LinkedHashMap<DateTime, List<Event>>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(myMap);

    state.selectedEvents = kEvents[day] ?? [Event('Пусто')];
    // emit(TableCalendarState(state.selectedEvents));
    // emit(TableCalendarState(kEvents[day] ?? [Event('Пусто')]));

    // тут запрашиваю из БД
    return kEvents[day] ?? [];

    // emit(TableCalendarState(kEvents[day] ?? [Event('Пусто')]));
    // print('object');
    // return kEvents[day] ?? [Event('Пусто')];
  }

  void addTask(String task) {
    state.selectedEvents?.add(Event(task));
    emit(TableCalendarState(state.selectedEvents));
    // emit(CalendarInitial());
  }

  // onDaySelected(DateTime selectedDay, DateTime focusedDay) {
  //   DateTime _selectedDay;
  //   _selectedDay = selectedDay;
  // }
}
