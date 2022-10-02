import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:table_calendar_example/model/event_model.dart';

final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
// )..addAll(_kEventSource);
)..addAll(myMap);

List<Event> someTaskList = [Event('Some task 1')];

Map<DateTime, List<Event>> myMap = {
  // kToday: [Event('Event 11')],
  // kToday: someTaskList,
  DateTime(kToday.year, kToday.month, kToday.day + 1): [
    Event('Some task 2'),
    Event('Some task 3'),
    Event('Some task 4'),
    Event('Some task 5'),
    Event('Some task 6'),
  ],
  DateTime(kToday.year, kToday.month, kToday.day + 2): [Event('Some task 9')],
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

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 4, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 4, kToday.day);
