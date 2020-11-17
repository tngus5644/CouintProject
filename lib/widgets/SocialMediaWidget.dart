import 'package:couintproject/models/loginmodel.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:couintproject/main.dart';

class SocialMediaWidget extends StatelessWidget {
  bool _isKakaoTalkInstalled = false;
  String _accountEmail;
  Future<String> futureToken;
  String token;

  _initKakaoTalkInstalled() async {
    final installed = await isKakaoTalkInstalled();
    _isKakaoTalkInstalled = installed;
  }

  _issueAccessToken(String authCode) async {
    try {
      var token = await AuthApi.instance.issueAccessToken(authCode);
      AccessTokenStore.instance.toStore(token);
      print('token : ');
      print(token.accessToken.toString());
    } catch (e) {
      print("error on issuing access token: $e");
    }
  }

  _loginWithKakao() async {
    try {
      var code = await AuthCodeClient.instance.request();
      print('code : ');
      print(code);
      await _issueAccessToken(code);
    } catch (e) {
      print(e);
    }
  }

  _loginWithTalk() async {
    try {
      var code = await AuthCodeClient.instance.requestWithTalk();
      await _issueAccessToken(code);
      final User user = await UserApi.instance.me();

      print(user.toString());
      futureToken = Future.value('fail');
      futureToken = postLogIn(
          user.id.toString(), user.toString());
      token = await futureToken;

    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    _initKakaoTalkInstalled();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          width: 45,
          height: 45,
          child: InkWell(
              onTap: () {
                print('kakao tap');
                _isKakaoTalkInstalled ? _loginWithTalk() : _loginWithKakao();
              },
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('img/kakaoIcon.png'),
                        fit: BoxFit.cover)),
              )),
        ),
        SizedBox(width: 10),
        SizedBox(
          width: 50,
          height: 45,
          child: InkWell(
            onTap: () {},
            child: Image.asset('img/facebook.png'),
          ),
        ),
        SizedBox(width: 10),
        SizedBox(
          width: 45,
          height: 45,
          child: InkWell(
            onTap: () {},
            child: Image.asset('img/google-plus.png'),
          ),
        ),
        SizedBox(width: 10),
        SizedBox(
          width: 45,
          height: 45,
          child: InkWell(
            onTap: () {},
            child: Image.asset('img/linkedin.png'),
          ),
        )
      ],
    );
  }
}
