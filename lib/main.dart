
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/screens/favourite_screen.dart';
import 'package:newsapp/screens/registration_screen.dart';
import 'package:newsapp/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/news_screen.dart';

void main() {
  return runApp(App());
}

class App extends StatefulWidget {


  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  String path = Registration.id;
  void setPath()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if(preferences.getBool('Logged')) {
      if ((DateTime
          .now()
          .microsecondsSinceEpoch - preferences.getInt('Time')) >= 7200)
        path = Registration.id;
      else
        path = NewsScreen.id;
    }else
      path = Registration.id;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:path,
     routes: {
       Registration.id :(context) => Registration(),
       LoginScreen.id:(context) => LoginScreen(),
       NewsScreen.id:(context) => NewsScreen(),
       FavouriteScreen.id :(context) => FavouriteScreen(),
     },
    );
  }
}


