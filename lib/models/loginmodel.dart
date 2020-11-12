import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<String> PostLogIn(String email, String password) async {
  String token;

  final response = await http.post('https://couint.com/api/login', body: {
    'email': email,
    'password': password,
  });


    token = parseLogIn(response.body);
    return token;


}

String parseLogIn(String responseBody) {

  if(jsonDecode(responseBody)['status']==1) {
    final parsed = jsonDecode(responseBody)['data'];
    LogIn couintLogIn = LogIn.fromJson(parsed);

    return couintLogIn.token;
  }
  else return 'postfail';
}

class LogIn {
  String token;
  LogIn({
    this.token,
  });

  factory LogIn.fromJson(Map<String, dynamic> json) {
    return LogIn(
      token: json['token'] as String,
    );
  }
}
