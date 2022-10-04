import 'dart:collection';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:table_calendar_example/cubit/calendar_cubit.dart';
import 'package:table_calendar_example/model/event_model.dart';
import 'package:table_calendar_example/pages/day_screen.dart';

import '../utils.dart';

class TableEvents extends StatefulWidget {
  // List<Event> _selectedEvents;

  // TableEvents(this._selectedEvents);
  @override
  _TableEventsState createState() => _TableEventsState();
}

class _TableEventsState extends State<TableEvents> {
  DateTime _focusedDay = DateTime.now();
  // DateTime? _selectedDay;
  DateTime? _selectedDay;

  // List<Event> _getEventsForDay(DateTime day) {

  //   // тут запрашиваю из БД
  //   return kEvents[day] ?? [];
  //   // return [Event('11')];
  // }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    // setState(() {
    // _selectedDay = selectedDay;
    // _focusedDay = focusedDay;
    // });

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => DayScreen(
                // selectedEvents: widget._selectedEvents,
                // selectedEvents: _getEventsForDay(selectedDay),
                selectedDay: selectedDay,
                // updateTableEventsState: _updateTableEventsState
              )),
    );

    // _selectedEvents = _getEventsForDay(selectedDay);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarCubit, CalendarState>(
      builder: (context, state) {
        final CalendarCubit readCubit = context.read<CalendarCubit>();
        // print("3 _selectedDay form BlocBuilder is $_selectedDay");

        return Column(
          children: [
            TableCalendar<Event>(
              // firstDay: kFirstDay,
              // lastDay: kLastDay,
              firstDay: DateTime(DateTime.now().year, DateTime.now().month - 4,
                  DateTime.now().day),
              lastDay: DateTime(DateTime.now().year, DateTime.now().month + 4,
                  DateTime.now().day),
              focusedDay: _focusedDay,
              // selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              // rangeSelectionMode: _rangeSelectionMode,
              eventLoader: readCubit.getEventsForTheDay,
              // eventLoader: _getEventsForDay,
              startingDayOfWeek: StartingDayOfWeek.monday,
              calendarStyle: CalendarStyle(
                outsideDaysVisible: true,
              ),
              onDaySelected: _onDaySelected,
              // onDaySelected: readCubit.onDaySelected(selectedDay!, _focusedDay),
              // onPageChanged: (focusedDay) {
              //   _focusedDay = focusedDay;
              //   print('focusedDay is $focusedDay');
              // },
            ),
            const SizedBox(height: 8.0),
          ],
        );
      },
    );
  }

  // void _updateTableEventsState() {
  //   setState(() {});
  // }
}
