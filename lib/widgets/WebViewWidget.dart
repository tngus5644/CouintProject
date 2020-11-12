import 'package:couintproject/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
      child : WebView(
        initialUrl: 'https://couint.com/openbanking/auth/loginByApi?token='+Home.token,
        javascriptMode: JavascriptMode.unrestricted,
      )));
  }
}
