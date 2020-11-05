import 'package:flutter/material.dart ';

class AccountWidget extends StatefulWidget {
  @override
  _AccountWidgetState createState() => _AccountWidgetState();
}

class _AccountWidgetState extends State<AccountWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
            child: Container(
      width: MediaQuery.of(context).size.width - 30,
      height: 120,
      child: Text('카드'),
    )));
  }
}
