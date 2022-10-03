import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:intl/date_symbol_data_local.dart';
import 'package:table_calendar_example/cubit/calendar_cubit.dart';

import 'pages/calendar_screen.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CalendarCubit(),
      child: MaterialApp(
        title: 'TableCalendar',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
            headline1: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: Colors.black),
          ),
        ),
        home: StartPage(),
      ),
    );
  }
}

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    CalendarCubit testCubit = BlocProvider.of<CalendarCubit>(context);
    testCubit.getData();

    return Scaffold(
      appBar: AppBar(
        title: Text('TableCalendar'),
      ),
      body: BlocBuilder<CalendarCubit, CalendarState>(
        builder: (context, state) {
          print(state.selectedEvents!);
          if (state is TableCalendarState) {
            return Center(
              child: TableEvents(state.selectedEvents!),
              // child: TableEvents(),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
