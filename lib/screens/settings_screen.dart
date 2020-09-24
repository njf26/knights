import 'package:flutter/material.dart';
import '../constants.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kAlmostWhite,
        //body: ,
        //TODO: give a couple settings options (game board size, undo option, etc)
      ),
    );
  }
}
