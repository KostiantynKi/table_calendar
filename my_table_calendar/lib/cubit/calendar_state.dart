part of 'calendar_cubit.dart';

@immutable
class CalendarState {
  List<Event>? selectedEvents;

  CalendarState({this.selectedEvents});

  // CalendarState copyWith({List<Event>? selectedEvents}) {
  //   return CalendarState(selectedEvents: selectedEvents ?? this.selectedEvents);
  // }
}

class CalendarInitial extends CalendarState {}

class TableCalendarState extends CalendarState {
  TableCalendarState(List<Event>? selectedEvents)
      : super(selectedEvents: selectedEvents);
}
