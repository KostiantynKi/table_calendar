import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar_example/cubit/calendar_cubit.dart';

import 'package:table_calendar_example/form_for_add_task.dart';
import 'package:table_calendar_example/model/event_model.dart';
import 'package:table_calendar_example/pages/calendar_screen.dart';
import 'package:table_calendar_example/utils.dart';

class DayScreen extends StatefulWidget {
  final DateTime? selectedDay;
  // final ValueNotifier<List<Event>> selectedEvents;
  final List<Event>? selectedEvents;
  final Function? updateTableEventsState;

  const DayScreen({
    required this.selectedEvents,
    this.selectedDay,
    this.updateTableEventsState,
  });

  @override
  State<DayScreen> createState() => _DayScreenState();
}

class _DayScreenState extends State<DayScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarCubit, CalendarState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('DayScreen'),
          ),
          body: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 300,
                child: ListView.builder(
                  //! need to correct mistake
                  // itemCount: widget.selectedEvents!.length,
                  itemCount: state.selectedEvents!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 4.0,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: ListTile(
                        onTap: () => print('${state.selectedEvents![index]} '),
                        // title: Text('${value[index]}'),
                        // title: Text('${state.selectedEvents![index]}'),
                        title: Text('${state.selectedEvents![index]}'),
                      ),
                    );
                  },
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FormTask(
                      selectedDay: widget.selectedDay,
                      // selectedDay: state.onDaySelected(),
                      updateDayScreen: _updateDayScreen,
                      updateTableEventsState: widget.updateTableEventsState),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue[100])),
                    onPressed: () {
                      Navigator.pop(context);
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => TableEvents()));
                      // widget.updateTableEventsState!();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        'Go back to calendar',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
        );
      },
    );
  }

  void _updateDayScreen() {
    setState(() {});
  }
}
