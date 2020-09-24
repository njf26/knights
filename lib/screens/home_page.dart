import 'package:flutter/material.dart';
import 'package:knights/constants.dart';
import 'package:knights/components/small_button.dart';
import 'package:knights/screens/game_page.dart';
import 'package:knights/screens/login_screen.dart';
import 'package:knights/screens/rules_screen.dart';
import 'package:knights/screens/scoreboard_screen.dart';
import 'package:knights/screens/settings_screen.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'authenticated_screen.dart';

class HomePage extends StatefulWidget {
  final _HomePageState homePage = _HomePageState();
  LoginScreen loginScreen;

  void changePage(int index) {
    homePage.pageIndex = index;
  }

  @override
  _HomePageState createState() {
    loginScreen = new LoginScreen(loginParent: this);
    return homePage;
  }
}

class _HomePageState extends State<HomePage> {
  //final _auth = FirebaseAuth.instance;

  static const HOME_INDEX = 0;
  static const GAME_INDEX = 1;
  static const ACCOUNT_INDEX = 2;
  static const SCOREBOARD_INDEX = 3;
  static const SETTINGS_INDEX = 4;
  static const RULES_INDEX = 5;
  static const ACCOUNT_AUTHENTICATED_INDEX = 6;

  int pageIndex = HOME_INDEX;
  GamePage game = new GamePage();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kAlmostWhite,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                color: kAlmostBlack,
                height: MediaQuery.of(context).size.height * 0.2,
                child: FlatButton(
                  padding: EdgeInsets.all(0),
                  child: Image(
                    image: AssetImage('images/knight_logo.png'),
                  ),
                  onPressed: () {
                    if (pageIndex == GAME_INDEX) {
                      game.game.pauseStopwatch();
                    }
                    setState(() {
                      pageIndex = HOME_INDEX;
                    });
                  },
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: IndexedStack(
                index: pageIndex,
                children: <Widget>[
                  homePageContent(),
                  game,
                  widget.loginScreen,
                  ScoreboardScreen(),
                  SettingsScreen(),
                  RulesScreen(),
                  AuthenticatedScreen()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column homePageContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "KNIGHTS",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.05,
                fontFamily: kFancyFont,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SmallButton(
                text: "My Account",
                onPress: () {
                  setState(() {
                    /*if (_auth.currentUser != null) {
                      pageIndex = ACCOUNT_AUTHENTICATED_INDEX;
                    } else {
                      pageIndex = ACCOUNT_INDEX;
                    }*/
                  });
                },
              ),
              SmallButton(
                text: "Scoreboard",
                onPress: () {
                  setState(() {
                    pageIndex = SCOREBOARD_INDEX;
                  });
                },
              ),
              SmallButton(
                text: "Settings",
                onPress: () {
                  setState(() {
                    pageIndex = SETTINGS_INDEX;
                  });
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                padding: const EdgeInsets.only(top: 16),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: kAlmostBlack,
                    borderRadius: new BorderRadius.only(
                      topLeft: Radius.circular(5.0),
                      bottomLeft: Radius.circular(5.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3))
                    ],
                  ),
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Play Knights',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.044,
                        color: Colors.white,
                        fontFamily: kFancyFont,
                      ),
                    ),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    pageIndex = GAME_INDEX;
                  });
                  game.alert();
                },
              ),
              FlatButton(
                padding: const EdgeInsets.only(top: 16),
                child: Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: kAlmostBlack,
                    borderRadius: new BorderRadius.only(
                      topLeft: Radius.circular(3.0),
                      bottomLeft: Radius.circular(3.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3))
                    ],
                  ),
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      'Game Rules',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.017,
                        color: kAlmostWhite,
                        fontFamily: kBasicFont,
                      ),
                    ),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    pageIndex = RULES_INDEX;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
