import 'package:flutter/material.dart';

const Color kAlmostBlack = Color(0xFF191919);
const Color kAlmostWhite = Color(0xFFF3F3F3);
const Color kMaroon = Color(0xFF891E21);
const Color kTransparentMaroon = Color(0x55891E21);

const String kFancyFont = "Fondamento";
const String kBasicFont = "Roboto";

const TextStyle kBasicTextWhite = TextStyle(
  color: kAlmostWhite,
  fontFamily: kBasicFont,
  fontSize: 15,
);

const TextStyle kBasicText = TextStyle(
  color: kAlmostBlack,
  fontFamily: kBasicFont,
  fontSize: 20,
);

const kTextInputDecor = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
