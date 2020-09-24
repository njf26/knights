import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:knights/constants.dart';
import 'package:knights/components/game_board.dart';

class GamePage extends StatefulWidget {
  final _GamePageState gamePage = _GamePageState();
  GameBoard game;

  @override
  _GamePageState createState() {
    game = new GameBoard(gamePageParent: this);
    return gamePage;
  }

  void alert() {
    gamePage.alertBoard();
  }

  void setGamePageTime(String newTime) {
    gamePage.setGamePageTime(newTime);
  }

  void setGamePageStats(int undo, int moves) {
    gamePage.setGamePageStats(undo, moves);
  }
}

class _GamePageState extends State<GamePage> {
  String gamePageTime = "00:00:00";
  int movesMade = 0;
  int undosMade = 0;

  void alertBoard() {
    widget.game.alert();
  }

  void setGamePageStats(int undo, int moves) {
    setState(() {
      undosMade = undo;
      movesMade = moves;
    });
  }

  void setGamePageTime(String newTime) {
    setState(() {
      gamePageTime = newTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kAlmostWhite,
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                height: MediaQuery.of(context).size.width * 0.1,
                child: Text(
                  'Moves undone: $undosMade',
                  style: TextStyle(
                    fontFamily: kBasicFont,
                  ),
                ),
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.all(16.0),
              ),
            ),
            Expanded(
              flex: 6,
              child: widget.game,
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    child: Center(
                      child: Text(
                        gamePageTime,
                        style: TextStyle(
                          fontSize: 17.0,
                          fontFamily: kBasicFont,
                        ),
                      ),
                    ),
                    width: 100.0,
                    height: 50.0,
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.black38,
                      width: 2.0,
                    )),
                  ),
                  Text('$movesMade/64',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: kBasicFont,
                      )),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.undo, size: 20.0),
                    color: kAlmostBlack,
                    onPressed: () {
                      widget.game.undo();
                    },
                  ),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.pause, size: 20.0),
                    color: kAlmostBlack,
                    onPressed: () {
                      widget.game.alert();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
