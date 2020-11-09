import 'package:couintproject/widgets/TopCenterContainer.dart';
import 'package:couintproject/widgets/mybottomnavigationbar.dart';
import 'package:flutter/material.dart';

import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:intl/intl.dart' show DateFormat;

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();

  void initState() {}
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _currentDate2 = DateTime(2019, 2, 3);

  DateTime _targetDateTime = DateTime.now();

  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {},
  );
  CalendarCarousel _calendarCarousel;

  @override
  void initState() {
    super.initState();
  }

  @override
  @override
  Widget build(BuildContext context) {
    _calendarCarousel = CalendarCarousel<Event>(
      onDayPressed: (DateTime date, List<Event> events) {
        this.setState(() => _currentDate2 = date);
      },
      height: 420.0,
      selectedDateTime: _currentDate2,
      targetDateTime: _targetDateTime,
      customGridViewPhysics: NeverScrollableScrollPhysics(),
      markedDateCustomTextStyle: TextStyle(
        fontSize: 18,
        color: Colors.blue,
      ),
      todayTextStyle: TextStyle(
        color: Colors.blue,
      ),
      todayButtonColor: Colors.white,
      selectedDayButtonColor: Colors.blueAccent,
      selectedDayTextStyle: TextStyle(
        color: Colors.white,
      ),
      prevDaysTextStyle: TextStyle(
        fontSize: 14,
        color: Colors.grey,
      ),
      onCalendarChanged: (DateTime date) {
        this.setState(() {
          _targetDateTime = date;
        });
      },
      onDayLongPressed: (DateTime date) {
        print('long pressed date $date');
      },
    );
//
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            TopCenterContainer(),
            Column(
              children: [
                SizedBox(height: 60),
                Center(
                  child: Card(
                    child: Container(
                      width: MediaQuery.of(context).size.width - 30,
                      height: MediaQuery.of(context).size.height / 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 16.0),
                            child: _calendarCarousel,
                          ), //
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: myBottomNavigationBar(),
    );
  }
}
