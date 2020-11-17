import 'package:couintproject/models/fetchAccount.dart';
import 'package:couintproject/screens/home.dart';
import 'package:couintproject/widgets/MyAccountWidget.dart';
import 'package:couintproject/widgets/NewAccountWidget.dart';
import 'package:couintproject/widgets/TopCenterContainer.dart';
import 'package:couintproject/widgets/mybottomnavigationbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<List> futureItems;
  List<Data> myItems = [];

  @override
  void initState() {
    print('init State in profile screen');
    myItems.clear();
    setName();
    super.initState();
  }

  setName() async {
    MyAccount myAccount = await fetchAPI(http.Client());
    Home.loginState.name = myAccount.data[0].accountHolderName;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
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
                        width: MediaQuery.of(context).size.width - 20,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      Home.loginState.name,
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      Home.loginState.email,
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
                                      Home.loginState.email = 'email';
                                      Home.loginState.isLogin = false;
                                      Navigator.popAndPushNamed(
                                          context, '/signin');
                                    });
                                  },
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
        FutureBuilder(
            future: fetchAPI(http.Client()),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                myItems = snapshot.data.data;
              }
              return Column(
                children: myItems
                    .map((e) => MyAccountwidget(
                          myItem: e,
                        ))
                    .toList(),
              );
            }),
        NewAccountWidget(),
      ])),
      bottomNavigationBar: myBottomNavigationBar(),
    );
  }
}
