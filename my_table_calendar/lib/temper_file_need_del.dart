// import 'package:flutter/material.dart';
// import 'package:intl/date_symbol_data_local.dart';

// import 'pages/calendar_screen.dart';

// void main() {
//   initializeDateFormatting().then((_) => runApp(MyApp()));
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'TableCalendar',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         textTheme: TextTheme(
//           headline1: TextStyle(
//               fontSize: 20.0, fontWeight: FontWeight.w500, color: Colors.black),
//         ),
//       ),
//       home: StartPage(),
//     );
//   }
// }

// class StartPage extends StatefulWidget {
//   @override
//   _StartPageState createState() => _StartPageState();
// }

// class _StartPageState extends State<StartPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('TableCalendar'),
//       ),
//       body: Center(
//         child: TableEvents(),
//       ),
//     );
//   }
// }





// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:table_calendar_example/model/event_model.dart';
// import 'package:table_calendar_example/pages/day_screen.dart';

// import '../utils.dart';

// class TableEvents extends StatefulWidget {
//   @override
//   _TableEventsState createState() => _TableEventsState();
// }

// class _TableEventsState extends State<TableEvents> {
//   late final ValueNotifier<List<Event>> _selectedEvents;
//   CalendarFormat _calendarFormat = CalendarFormat.month;
//   RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
//       .toggledOff; // Can be toggled on/off by longpressing a date
//   DateTime _focusedDay = DateTime.now();
//   DateTime? _selectedDay;
//   DateTime? _rangeStart;
//   DateTime? _rangeEnd;

//   @override
//   void initState() {
//     super.initState();
//     // тут инициализирую БД

//     _selectedDay = _focusedDay;
//     print("${_selectedDay} _selectedDay");

//     _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
//   }

//   @override
//   void dispose() {
//     _selectedEvents.dispose();
//     super.dispose();
//   }

//   List<Event> _getEventsForDay(DateTime day) {
//     // Implementation example
//     // print("${day} ___day_");

//     // print("${kEvents[day]} _____________");
//     // тут запрашиваю из БД
//     return kEvents[day] ?? [];
//   }

//   void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
//     if (!isSameDay(_selectedDay, selectedDay)) {
//       setState(() {
//         print('$selectedDay is selectedDay');
//         // print("_selectedEvents.value ${_selectedEvents.value}");
//         _selectedDay = selectedDay;
//         _focusedDay = focusedDay;
//         _rangeStart = null; // Important to clean those
//         _rangeEnd = null;
//         _rangeSelectionMode = RangeSelectionMode.toggledOff;

//         Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) => DayScreen(selectedEvents: _selectedEvents)),
//         );
//       });

//       _selectedEvents.value = _getEventsForDay(selectedDay);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TableCalendar<Event>(
//           firstDay: kFirstDay,
//           lastDay: kLastDay,
//           focusedDay: _focusedDay,
//           selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
//           rangeStartDay: _rangeStart,
//           rangeEndDay: _rangeEnd,
//           calendarFormat: _calendarFormat,
//           rangeSelectionMode: _rangeSelectionMode,
//           eventLoader: _getEventsForDay,
//           startingDayOfWeek: StartingDayOfWeek.monday,
//           calendarStyle: CalendarStyle(
//             // Use `CalendarStyle` to customize the UI
//             outsideDaysVisible: true,
//           ),
//           onDaySelected: _onDaySelected,
//           // onRangeSelected: _onRangeSelected,
//           onFormatChanged: (format) {
//             if (_calendarFormat != format) {
//               setState(() {
//                 _calendarFormat = format;
//               });
//             }
//           },
//           onPageChanged: (focusedDay) {
//             _focusedDay = focusedDay;
//           },
//         ),
//         const SizedBox(height: 8.0),
//       ],
//     );
//   }
// }





// import 'dart:collection';

// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:table_calendar_example/model/event_model.dart';

// // final kEvents = <DateTime, List<Event>>{
// //   DateTime.now(): [Event('RRR')]
// // }..addAll(_kEventSource);

// /// Example events.
// ///
// /// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
// final kEvents = LinkedHashMap<DateTime, List<Event>>(
//   equals: isSameDay,
//   hashCode: getHashCode,
// // )..addAll(_kEventSource);
// )..addAll(myMap);

// // !!!
// // List listGenerate = [100, 111, 121];
// // List<Event> eventList = [Event('Event x')];

// // final _kEventSource = Map.fromIterable(listGenerate,
// //     key: (item) => DateTime.utc(kFirstDay.year, kFirstDay.month, item * 1),
// //     value: (item) => eventList);
// // !!!

// Map<DateTime, List<Event>> myMap = {
//   kToday: [Event('Event 11')],
//   DateTime(kToday.year, kToday.month - 1, kToday.day + 1): [
//     Event('Event 22'),
//     Event('Event 223'),
//     Event('Event 223'),
//     Event('Event 223'),
//     Event('Event 223'),
//     Event('Event 223'),
//     Event('Event 223'),
//   ],
//   DateTime(kToday.year, kToday.month - 1, kToday.day + 2): [Event('Event 223')],
//   DateTime(kToday.year, kToday.month, kToday.day + 10): [Event('Event 33')],
//   DateTime(kToday.year, kToday.month, kToday.day + 14): [Event('Event 44')],
//   DateTime(kToday.year, kToday.month, kToday.day + 16): [Event('Event 55')],
// };

// // myMap[kToday] = (Event('111')).toList();

// // final _kEventSource = Map.fromIterable(List.generate(50, (index) => index),
// //     key: (item) => DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5),
// //     value: (item) => List.generate(
// //         item % 4 + 1, (index) => Event('Event $item | ${index + 1}')))
// //   ..addAll({
// //     kToday: [
// //       Event('Today\'s Event 1'),
// //       Event('Today\'s Event 2'),
// //     ],
// //   });

// int getHashCode(DateTime key) {
//   return key.day * 1000000 + key.month * 10000 + key.year;
// }

// // /// Returns a list of [DateTime] objects from [first] to [last], inclusive.
// // List<DateTime> daysInRange(DateTime first, DateTime last) {
// //   final dayCount = last.difference(first).inDays + 1;
// //   return List.generate(
// //     dayCount,
// //     (index) => DateTime.utc(first.year, first.month, first.day + index),
// //   );
// // }

// final kToday = DateTime.now();
// final kFirstDay = DateTime(kToday.year, kToday.month - 4, kToday.day);
// final kLastDay = DateTime(kToday.year, kToday.month + 4, kToday.day);





// class Event {
//   final String title;

//   const Event(this.title);

//   @override
//   String toString() => title;
// }




// import 'package:flutter/material.dart';
// import 'package:table_calendar_example/form_for_add_task.dart';
// import 'package:table_calendar_example/model/event_model.dart';
// import 'package:table_calendar_example/utils.dart';

// class DayScreen extends StatelessWidget {
//   final ValueNotifier<List<Event>> selectedEvents;

//   const DayScreen({required this.selectedEvents});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('DayScreen'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Container(
//               height: 300,
//               child: ValueListenableBuilder<List<Event>>(
//                 valueListenable: selectedEvents,
//                 builder: (context, value, _) {
//                   return ListView.builder(
//                     itemCount: value.length,
//                     itemBuilder: (context, index) {
//                       return Container(
//                         margin: const EdgeInsets.symmetric(
//                           horizontal: 12.0,
//                           vertical: 4.0,
//                         ),
//                         decoration: BoxDecoration(
//                           border: Border.all(),
//                           borderRadius: BorderRadius.circular(12.0),
//                         ),
//                         child: ListTile(
//                           onTap: () => print('${value[index]}'),
//                           title: Text('${value[index]} ppp'),
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 FormTask(),
//                 ElevatedButton(
//                   style: ButtonStyle(
//                       backgroundColor:
//                           MaterialStateProperty.all(Colors.blue[100])),
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: Padding(
//                     padding: const EdgeInsets.all(6.0),
//                     child: Text(
//                       'Go back to calendar',
//                       style: Theme.of(context).textTheme.headline1,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';

// class FormTask extends StatefulWidget {
//   const FormTask({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<FormTask> createState() => _MyFormTask();
// }

// class _MyFormTask extends State<FormTask> {
//   final myController = TextEditingController();

//   void _incrementCounter() {
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       child: Dialog(
//           backgroundColor: Colors.blue,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//           elevation: 12,
//           child: Container(
//             padding: EdgeInsets.all(20),
//             alignment: Alignment.topCenter,
//             // height: 220,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   'Add task',
//                   style: Theme.of(context).textTheme.headline1,
//                 ),
//                 const SizedBox(height: 14.0),
//                 Container(
//                   // height: 30,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(6.0),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 10.0),
//                     child: TextFormField(
//                       controller: myController,
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         labelText: 'Enter a task',
//                         hintStyle: TextStyle(
//                           color: Colors.grey,
//                           fontSize: 18.0,
//                         ),
//                       ),
//                       // The validator receives the text that the user has entered.
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter some text';
//                         }
//                         return null;
//                       },
//                     ),
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Container(
//                       margin: EdgeInsets.fromLTRB(0, 9, 0, 0),
//                       height: 35,
//                       width: 150,
//                       child: ElevatedButton(
//                         style: ButtonStyle(
//                             backgroundColor: MaterialStateProperty.all<Color>(
//                                 Colors.blue[100]!),
//                             shape: MaterialStateProperty.all<
//                                 RoundedRectangleBorder>(RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8.0),
//                               // side: BorderSide(color: Colors.red),
//                             ))),
//                         child: Text(
//                           'Save',
//                           style: Theme.of(context).textTheme.headline1,
//                         ),
//                         onPressed: () {},
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           )),
//     );
//   }
// }
