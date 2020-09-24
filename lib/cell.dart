class Cell {
  //true if player already filled this cell. Defaults to false
  bool _played;

  //number where this cell lies in order of plays
  int _numberPlayed;

  //list of cell indexes that are correct distance from this cell
  List<int> _playableCells;

  Cell(index) {
    this._played = false;
    this._playableCells = new List();
    List<int> potentials = new List();
    String indexType;

    //someday board width will depend on settings
    int boardWidth = 8;

    if (index == 0 || index % boardWidth == 0) {
      indexType = "1-step-left";
    } else if ((index + 1) % boardWidth == 0) {
      indexType = "1-step-right";
    } else if (index == 1 || (index - 1) % boardWidth == 0) {
      indexType = "2-step-left";
    } else if ((index + 2) % boardWidth == 0) {
      indexType = "2-step-right";
    } else {
      indexType = "middle";
    }

    if (indexType != "1-step-right") {
      potentials.add(index - 16 + 1);
      potentials.add(index + 16 + 1);
      if (indexType != "2-step-right") {
        potentials.add(index + 2 - 8);
        potentials.add(index + 2 + 8);
      }
    }

    if (indexType != "1-step-left") {
      potentials.add(index - 16 - 1);
      potentials.add(index + 16 - 1);
      if (indexType != "2-step-left") {
        potentials.add(index - 2 - 8);
        potentials.add(index - 2 + 8);
      }
    }

    for (int i in potentials) {
      if (i >= 0 && i < 64) {
        _playableCells.add(i);
      }
    }
  }

  bool isPlayed() {
    return _played;
  }

  //set cell to opposite of current played bool
  void playCell() {
    this._played = !this._played;
    if (!this._played) {
      setNumberPlayed(null);
    }
  }

  void setNumberPlayed(number) {
    this._numberPlayed = number;
  }

  int getNumberPlayed() {
    return this._numberPlayed;
  }

  List<int> getPlayableCells() {
    return this._playableCells;
  }

  @override
  String toString() {
    return 'Played: $_numberPlayed, isPlayed: $_played';
  }
}
