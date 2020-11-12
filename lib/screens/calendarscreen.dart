import 'package:couintproject/widgets/TopCenterContainer.dart';
import 'package:couintproject/widgets/mybottomnavigationbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();

  void initState() {}
}

class _CalendarScreenState extends State<CalendarScreen>with TickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
//
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            TopCenterContainer(),
            Column(
              children: [
                SizedBox(height: 80),
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
                            child: Text('a'),
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
