import 'package:flutter/material.dart';
import '../constants.dart';

class ScoreboardScreen extends StatefulWidget {
  @override
  _ScoreboardScreenState createState() => _ScoreboardScreenState();
}

class _ScoreboardScreenState extends State<ScoreboardScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kAlmostWhite,
        //body: ,
        //TODO: display scores using data from db
        //have a section for personal top scores
        //and a section for worldwide top scores
      ),
    );
  }
}
