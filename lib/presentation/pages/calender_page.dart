import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderPage extends StatefulWidget {
  const CalenderPage({super.key});

  @override
  State<CalenderPage> createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {
  //DateTime now = DateTime.utc(2022, 10, 15, 14, 30, 000);
  late Map<DateTime, List<Event>> selectedEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  TextEditingController _eventController = TextEditingController();

  void initState() {
    selectedEvents = {};
    super.initState();
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Calender"), centerTitle: true),
        body: ListView(
          children: [
            TableCalendar(
              eventLoader: (day) {
                return _getEventsForDay(day);
              },
              //eventLoader: _getEventsForDay,
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              startingDayOfWeek: StartingDayOfWeek.monday,
              calendarStyle: CalendarStyle(
                  isTodayHighlighted: true,
                  selectedDecoration: BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                  )),
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: ((DateTime selectDay, DateTime focusDay) {
                setState(() {
                  _selectedDay = selectDay;
                  _focusedDay = focusDay;
                });
              }),
              //availableCalendarFormats: {CalendarFormat.month: 'Month', CalendarFormat.twoWeeks: '2 weeks', CalendarFormat.week: 'Week'},
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
            ),
            ..._getEventsForDay(_selectedDay).map((Event event) => ListTile(
                  title: Text(event.title),
                )),
            SizedBox(height: 30),
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text("Add Event"),
                            content: TextFormField(
                              controller: _eventController,
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("cancel")),
                              TextButton(
                                  onPressed: () {
                                    if (_eventController.text.isEmpty) {
                                    } else {
                                      if (selectedEvents[_selectedDay] != null) {
                                        selectedEvents[_selectedDay]?.add(
                                          Event(title: _eventController.text),
                                        );
                                      } else {
                                        selectedEvents[_selectedDay] = [Event(title: _eventController.text)];
                                      }
                                    }
                                    _eventController.clear();
                                    Navigator.pop(context);
                                    setState(() {});
                                    return;
                                  },
                                  child: Text("ok"))
                            ],
                          ));
                },
                icon: Icon(Icons.add))
          ],
        )); //Container();
  }

  List<Event> _getEventsForDay(DateTime day) {
    return selectedEvents[day] ?? [];
  }
}

class Event {
  String title;
  Event({required this.title});

  String toString() => this.title;
}
