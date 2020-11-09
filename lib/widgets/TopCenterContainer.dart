import 'package:flutter/material.dart';


class TopCenterContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 5,
          decoration: BoxDecoration(color: Colors.blueAccent),
          padding: EdgeInsets.all(5),
          alignment: Alignment.topCenter,
          child: SizedBox(
              width: 200,
              height: 80,
              child: Image.asset(
                'img/couint_logo8.png',
              )),
    );
  }
}
