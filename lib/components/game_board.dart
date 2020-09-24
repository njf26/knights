import 'dart:async';

import 'package:flutter/material.dart';
import 'package:knights/constants.dart';
import 'package:knights/cell.dart';
import 'package:knights/screens/game_page.dart';

import 'option_button.dart';

class GameBoard extends StatefulWidget {
  final _GameBoardState gameBoard = _GameBoardState();
  final GamePage gamePageParent;

  GameBoard({@required this.gamePageParent});

  @override
  _GameBoardState createState() => gameBoard;

  void alert() {
    gameBoard.createAlert();
  }

  void pauseStopwatch() {
    gameBoard.watch.stop();
  }

  void undo() {
    gameBoard.undoMove();
  }
}

class _GameBoardState extends State<GameBoard> {
  int numberPlays = 0;
  int selectedIndex;
  List<Cell> boardCells = List(64);
  int lastPlayedIndex;
  bool gameOver = false;
  Stopwatch watch = new Stopwatch();
  final duration = const Duration(seconds: 1);
  String time = '00:00:00';
  int playsUndone = 0;

  void startTimer() {
    Timer(duration, keepRunning);
  }

  void keepRunning() {
    startTimer();
    setState(() {
      time = watch.elapsed.inHours.toString().padLeft(2, '0') +
          ':' +
          (watch.elapsed.inMinutes % 60).toString().padLeft(2, '0') +
          ':' +
          (watch.elapsed.inSeconds % 60).toString().padLeft(2, '0');
    });
    widget.gamePageParent.setGamePageTime(time);
  }

  void startStopwatch() {
    watch.start();
    startTimer();
  }

  Color pickBackground(int index) {
    if (boardCells[index].isPlayed()) {
      return kMaroon;
    } else if (selectedIndex != null &&
        boardCells[selectedIndex].getPlayableCells().contains(index)) {
      return kTransparentMaroon;
    } else {
      return kAlmostWhite;
    }
  }

  void playCell(index) {
    if (!boardCells[index].isPlayed()) {
      if ((lastPlayedIndex != null &&
              boardCells[lastPlayedIndex].getPlayableCells().contains(index)) ||
          lastPlayedIndex == null) {
        numberPlays++;
        boardCells[index].playCell();
        boardCells[index].setNumberPlayed(numberPlays);
        selectedIndex = index;
        lastPlayedIndex = index;

        widget.gamePageParent.setGamePageStats(playsUndone, numberPlays);

        gameOver = true;
        for (int i = 0;
            i < boardCells[lastPlayedIndex].getPlayableCells().length;
            i++) {
          int checkIndex = boardCells[lastPlayedIndex].getPlayableCells()[i];
          if (!boardCells[checkIndex].isPlayed()) {
            gameOver = false;
            break;
          }
        }

        if (gameOver) {
          createAlert();
        }
      }
    }
  }

  void undoMove() {
    if (numberPlays > 0) {
      setState(() {
        numberPlays--;
        boardCells[lastPlayedIndex].playCell();

        lastPlayedIndex = boardCells
            .indexWhere((element) => element.getNumberPlayed() == numberPlays);
        if (lastPlayedIndex == -1) {
          lastPlayedIndex = null;
        }
        playsUndone++;
        selectedIndex = lastPlayedIndex;
      });
      widget.gamePageParent.setGamePageStats(playsUndone, numberPlays);
    }
  }

  Future<String> createAlert() {
    watch.stop();

    bool newGame = time == '00:00:00';
    String title = gameOver ? "Game Over" : "Game Paused";
    String stats = "Select an option below.";
    if (gameOver) {
      stats = numberPlays == 64 ? "You Won!" : "You Lost!";
    }

    if (!newGame) {
      return showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: kAlmostWhite,
              title: Center(
                child: Text(
                  title,
                  style: TextStyle(
                    fontFamily: kFancyFont,
                    color: kAlmostBlack,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(time, style: kBasicText),
                      Text("$numberPlays/64", style: kBasicText),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      stats,
                      style: kBasicText,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      title == "Game Paused"
                          ? OptionButton("Resume", () {
                              Navigator.pop(context);
                              watch.start();
                            })
                          : Text(''),
                      OptionButton("New Game", () {
                        watch.reset();
                        startNewGame();
                        Navigator.pop(context);
                      }),
                    ],
                  ),
                ],
              ),
            );
          });
    } else {
      //this is the very first game played, no alert necessary
      startNewGame();
      return null;
    }
  }

  void startNewGame() {
    setState(() {
      this.numberPlays = 0;
      this.selectedIndex = null;
      this.lastPlayedIndex = null;
      this.gameOver = false;
      this.playsUndone = 0;
      widget.gamePageParent.setGamePageStats(0, 0);
      startStopwatch();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.width * 0.9,
      child: GridView.count(
        // Create a grid with 8 columns (this eventually will depend on settings)
        crossAxisCount: 8,
        // Generate 64 widgets that display their index in the List.
        children: List.generate(64, (index) {
          if (numberPlays == 0) {
            boardCells[index] = new Cell(index);
          }
          return FlatButton(
            padding: EdgeInsets.all(0),
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(colors: [
                  pickBackground(index),
                  Colors.black,
                ], radius: 7, focal: Alignment.center),
                border: Border.all(color: Colors.black38),
              ),
              alignment: Alignment.center,
              width: (MediaQuery.of(context).size.width * 0.9) / 8,
              height: (MediaQuery.of(context).size.width * 0.9) / 8,
              child: Text(
                boardCells[index].isPlayed()
                    ? boardCells[index].getNumberPlayed().toString()
                    : '',
                style: TextStyle(
                  color: kAlmostWhite,
                  fontFamily: kBasicFont,
                  fontSize: 20,
                ),
              ),
            ),
            onPressed: () {
              //display options
              setState(() {
                selectedIndex = index;
              });
            },
            onLongPress: () {
              //play this cell
              setState(() {
                playCell(index);
              });
            },
          );
        }),
      ),
    );
  }
}
