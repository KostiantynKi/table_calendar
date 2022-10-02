// import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:table_calendar_example/model/event_model.dart';
import 'package:table_calendar_example/utils.dart';

class FormTask extends StatefulWidget {
  final DateTime? selectedDay;
  final Function? updateDayScreen;
  final Function? updateTableEventsState;

  const FormTask({
    Key? key,
    this.selectedDay,
    this.updateDayScreen,
    this.updateTableEventsState,
  }) : super(key: key);

  @override
  State<FormTask> createState() => _MyFormTask();
}

class _MyFormTask extends State<FormTask> {
  final myController = TextEditingController();

  List<Event> _getEventsForTheDay(DateTime day) {
    // print("${kEvents[day]} _____________");
    // тут запрашиваю из БД
    return kEvents[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Dialog(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          elevation: 12,
          child: Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.topCenter,
            // height: 220,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Add task',
                  style: Theme.of(context).textTheme.headline1,
                ),
                const SizedBox(height: 14.0),
                Container(
                  // height: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: TextFormField(
                      controller: myController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Enter a task',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 18.0,
                        ),
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 9, 0, 0),
                      height: 35,
                      width: 150,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.blue[100]!),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              // side: BorderSide(color: Colors.red),
                            ))),
                        child: Text(
                          'Save',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        onPressed: () {
                          setState(() {
                            myMap[DateTime(
                                widget.selectedDay!.year,
                                widget.selectedDay!.month,
                                widget.selectedDay!.day)] = [
                              Event(myController.text)
                            ];
                            print('myMap is $myMap');
                            someTaskList.add(Event(myController.text));
                            ValueNotifier(
                                _getEventsForTheDay(widget.selectedDay!));
                            widget.updateTableEventsState!();
                            widget.updateDayScreen!();
                          });

                          // newTask = myController.text;
                          // print(newTask = myController.text);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
