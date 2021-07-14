import 'dart:ui';
import 'package:newsapp/components/sign_up_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:newsapp/components/MyInput.dart';
import 'package:newsapp/components/rounded_button.dart';
import 'package:newsapp/screens/registration_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;

import 'news_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);
  static String id = 'LoginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email ;
  String password;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/background1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top : 90.0),
                      child: Text(
                        "Welcome!!!",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF5F4F3),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        topRight: Radius.circular(50.0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 40.0,
                        ),
                        Center(
                          child: Text(
                            "SignIn",
                            style: TextStyle(
                              color: Colors.blue[900],
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        MyInputField(
                          hintText: "Email",
                          onChange: (value) {
                           email =value;
                          },
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        MyInputField(
                          hintText: "Password",
                          onChange: (value) {
                            password =value;
                          },
                        ),

                        SizedBox(
                          height: 25.0,
                        ),
                        RoundButton(
                          onPressed: () async {
                            SharedPreferences _prefs = await SharedPreferences
                                .getInstance();
                            String url = 'https://www.postman.com/collections/299632c9a18ed457ba78';
                            http.Response res = await http.post(
                                Uri.parse(url), body: {
                              'email': email,
                              'password': password,
                            }
                            );
                            print(res.statusCode);
                            print(res.body);
                            await _prefs.setBool('Logged', true);
                            await _prefs.setInt('Time', DateTime
                                .now()
                                .microsecondsSinceEpoch);
                            await _prefs.setString('email', email);
                            Navigator.pushNamed(context, NewsScreen.id);
                          },
                          text: "SignIn",
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 30.0, right: 30.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.all(12.0),
                                  child: Divider(
                                    color: Colors.black,
                                    height: 50.0,
                                  ),
                                ),
                              ),
                              Text("Or Sign In With"),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.all(12.0),
                                  child: Divider(
                                    color: Colors.black,
                                    height: 50.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 50.0,
                            right: 50.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SignInButton(
                                onPressed: () {
                                  print('Google Signin');
                                },
                                address: 'images/google.jpg',
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              SignInButton(
                                onPressed: () {
                                  print('Facebook Signin');
                                },
                                address: 'images/facebook.png',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account?  "),
                            GestureDetector(
                                child: Text(
                                  "SignUp",
                                  style: TextStyle(color: Color(0xFFB99066)),
                                ),
                              onTap: (){
                                  Navigator.pop(context);
                                  Navigator.pushNamed(context, Registration.id);
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
