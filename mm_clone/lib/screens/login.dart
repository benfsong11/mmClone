import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/auth.dart';
import 'package:mm_clone/screens/profile.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<void> _loginButtonPressed() async {
    String authCode = await AuthCodeClient.instance.request();
    print(authCode);
    if (authCode != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 170, horizontal: 40),
            child: RichText(
              // RichText와 TextSpan을 활용하여 글씨에 각각 다르게 TextStyle 적용
              text: TextSpan(
                text: "음-",
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: "그냥\n편하게 듣고\n쉽게 말해요\n우리",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: _loginButtonPressed,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.deepPurple,
                      ),
                      padding: MaterialStateProperty.all(
                        EdgeInsets.all(15),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                    child: Text(
                      "카카오계정으로 로그인",
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  TextButton(
                    onPressed: _loginButtonPressed,
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                    ),
                    child: Text(
                      "직접 입력해서 로그인",
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
