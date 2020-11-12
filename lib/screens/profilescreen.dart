import 'package:couintproject/models/column_builder.dart';
import 'package:couintproject/widgets/AccountWidget.dart';
import 'package:couintproject/widgets/NewAccountWidget.dart';
import 'package:couintproject/widgets/SocialMediaWidget.dart';
import 'package:couintproject/widgets/TopCenterContainer.dart';
import 'package:couintproject/widgets/WebViewWidget.dart';
import 'package:couintproject/widgets/mybottomnavigationbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:couintproject/widgets/SignInWidget.dart';
import 'package:couintproject/widgets/ProfileWidget.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List myItems = [];

  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white70,
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(
            children: [
              TopCenterContainer(),
              Column(
                children: [
                  SizedBox(height: 80),
                  Center(
                    child: Card(
                      child: Container(
                          width: MediaQuery.of(context).size.width - 30,
                          height: MediaQuery.of(context).size.width / 4 + 20,
                          child: Column(
                            children: [
                              Padding(padding: EdgeInsets.all(5)),
                              Row(children: [
                                Padding(
                                  padding: EdgeInsets.all(5),
                                ),
                                CircleAvatar(
                                  radius: 30,
                                ),
                                Padding(padding: EdgeInsets.all(10)),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'ost',
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'ost5253@gmail.com',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.blueAccent,
                                        ),
                                      )
                                    ])
                              ]),
                              ButtonTheme(
                                  minWidth: 200,
                                  shape: RoundedRectangleBorder(),
                                  buttonColor: Colors.blueAccent,

                                  child: RaisedButton(
                                    onPressed: () {

                                    setState(() {
                                    });},
                                    child: Text('LogOut'),
                                    color: Colors.blueAccent,
                                  )),
                            ],
                          )),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(8),
          ),
          Text(
            '  내 계좌',
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: EdgeInsets.all(5),
          ),
          Column(
            children: myItems.isEmpty == true
                ? [NewAccountWidget()]
                : myItems.map<Widget>((item) {
                    return item;
                  }).toList(),
          ),
        ])),
      bottomNavigationBar: myBottomNavigationBar(),
    );
  }
}
