import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarFormat format = CalendarFormat.month;
  DateTime SelectedDay = DateTime.now();
  DateTime FocusedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: size.height * 0.1,
        backgroundColor: Colors.white,
        shadowColor: Colors.blue[300],
        title: Column(
          children: <Widget>[
            SizedBox(
              height: size.height * 0.03,
            ),
            Container(child: Image.asset('assets/images/DislexIA.png')),
          ],
        ),
      ),
      body: Center(
        child: TableCalendar(
          focusedDay: SelectedDay,
          firstDay: DateTime(1990),
          lastDay: DateTime(2050),
          calendarFormat: format,
          onFormatChanged: (CalendarFormat _format) {
            setState(() {
              format = _format;
            });
          },
          startingDayOfWeek: StartingDayOfWeek.sunday,
          daysOfWeekVisible: true,

          //Day Changed
          onDaySelected: (DateTime selectDAY, DateTime focusDay) {
            setState(() {
              SelectedDay = SelectedDay;
              FocusedDay = focusDay;
            });
            print(FocusedDay);
          },
          selectedDayPredicate: (DateTime date) {
            return isSameDay(SelectedDay, date);
          },

          //To style the Calendar
          calendarStyle: CalendarStyle(
            isTodayHighlighted: true,
            selectedDecoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(5.0),
            ),
            selectedTextStyle: TextStyle(color: Colors.white),
            todayDecoration: BoxDecoration(
              color: Colors.purpleAccent,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(5.0),
            ),
            defaultDecoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(5.0),
            ),
            weekendDecoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
            formatButtonShowsNext: true,
            formatButtonDecoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(5.0),
            ),
            formatButtonTextStyle: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
