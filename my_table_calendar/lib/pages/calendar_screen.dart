import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:table_calendar_example/model/event_model.dart';
import 'package:table_calendar_example/pages/day_screen.dart';

import '../utils.dart';

class TableEvents extends StatefulWidget {
  @override
  _TableEventsState createState() => _TableEventsState();
}

class _TableEventsState extends State<TableEvents> {
  late final ValueNotifier<List<Event>> _selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  String? newTask;

  @override
  void initState() {
    super.initState();
    // тут инициализирую БД

    _selectedDay = _focusedDay;
    // print("${_selectedDay} _selectedDay");

    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    // print("${kEvents[day]} _____________");
    // тут запрашиваю из БД
    return kEvents[day] ?? [];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        // print('$selectedDay is selectedDay');
        // print("Календарь перестроился");

        // print("_selectedEvents.value ${_selectedEvents.value}");
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;

        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DayScreen(
                  selectedEvents: _selectedEvents,
                  selectedDay: _selectedDay,
                  updateTableEventsState: _updateTableEventsState)),
        );
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
      print("_selectedEvents.value is ${_selectedEvents.value}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar<Event>(
          firstDay: kFirstDay,
          lastDay: kLastDay,
          focusedDay: _focusedDay,
          selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          rangeStartDay: _rangeStart,
          rangeEndDay: _rangeEnd,
          // calendarFormat: _calendarFormat,
          rangeSelectionMode: _rangeSelectionMode,
          eventLoader: _getEventsForDay,
          startingDayOfWeek: StartingDayOfWeek.monday,
          calendarStyle: CalendarStyle(
            // Use `CalendarStyle` to customize the UI
            outsideDaysVisible: true,
          ),
          onDaySelected: _onDaySelected,
          // onRangeSelected: _onRangeSelected,
          // onFormatChanged: (format) {
          //   if (_calendarFormat != format) {
          //     setState(() {
          //       _calendarFormat = format;
          //       // print('$_calendarFormat _calendarFormat');
          //     });
          //   }
          // },
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
          },
        ),
        const SizedBox(height: 8.0),
      ],
    );
  }

  void _updateTableEventsState() {
    setState(() {});
  }
}
