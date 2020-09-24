import 'package:flutter/material.dart';
import 'package:knights/screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Knights',
      home: HomePage(),
      //eventually a login screen will come before homepage
      routes: {
        //'/': (context) => HomePage(),
        //'/game': (context) => GamePage(),
        //'/account': (context) => AccountPage(),
        //'/scoreboard': (context) => ScoreboardPage(),
        //'/settings': (context) => SettingsPage(),
        //'/rules': (context) => RulesPage(),
      },
    );
  }
}
