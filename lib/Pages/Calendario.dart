import 'package:descubrecaliapp/constantes.dart';
import 'package:descubrecaliapp/models/Event.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendario extends StatefulWidget {
  @override
  _CalendarioState createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  Map<DateTime, List<Event>> selectedEvents = {
    DateTime.utc(2021, 7, 30): [
      Event(titulo: "Delirio"),
      Event(titulo: "Mascotas"),
    ],
    DateTime.utc(2021, 7, 28): [Event(titulo: "Delirio")],
  };

  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi calendario'),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          TableCalendar(
            eventLoader: _getEventsfromDay,
            calendarStyle: CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: Colors.blue,
              ),
              todayDecoration: BoxDecoration(
                color: kprimaryColor,
                shape: BoxShape.circle,
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
            ),
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: focusedDay,
            calendarFormat: CalendarFormat.month,
            startingDayOfWeek: StartingDayOfWeek.monday,
            daysOfWeekVisible: true,
            weekendDays: <int>[DateTime.saturday, DateTime.sunday],
            onDaySelected: (DateTime _selectedDay, DateTime _focusedDay) {
              setState(() {
                selectedDay = _selectedDay;
                focusedDay = _focusedDay;
                print(focusedDay);
                print(selectedEvents);
              });
            },
            selectedDayPredicate: (DateTime date) {
              return isSameDay(selectedDay, date);
            },

            // onFormatChanged: (_format) {
            //   setState(() {
            //     format = _format;
            //   });
            // },
          ),
          SizedBox(height: 10),
          ..._getEventsfromDay(selectedDay).map(
            (Event event) => Card(
              child: ListTile(
                title: Text(
                  event.titulo,
                ),
                trailing: Text("7:30pm"),
                tileColor: Colors.purpleAccent[200],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
