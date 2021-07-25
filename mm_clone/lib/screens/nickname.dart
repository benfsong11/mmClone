import 'package:flutter/material.dart';

import 'signup_success.dart';

class NicknamePage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _nicknameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 100,
                    horizontal: 20,
                  ),
                  child: Text(
                    "닉네임을 입력하세요",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      primaryColor: Colors.deepPurple,
                    ),
                    child: TextFormField(
                      cursorColor: Colors.deepPurple,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      controller: _nicknameController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        hintText: "닉네임 입력",
                        hintStyle: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 25,
                        ),
                      ),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "올바른 닉네임을 입력하세요.";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Text(
                    "음(mm)에서 사용할 이름이에요.\n7자 이상인 경우 잘려 보일 수 있어요!",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignupSuccessPage()),
                      );
                    },
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
                      "다음",
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
