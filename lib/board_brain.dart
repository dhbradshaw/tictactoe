enum SquareState {
  X, // First Player
  O, // Second Player
  N, // Empty
}

class BoardBrain {
  BoardBrain(this.moves) {
    initializeStates();
  }

  final List<int> moves;
  List<SquareState> states;
  final List<List<int>> toCheck = [
    // Horizontals
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    // Verticals
    [0, 3, 6],
    [1, 4, 7],
    [6, 7, 8],
    // Diagonals
    [0, 4, 8],
    [2, 4, 6],
  ];

  state(int index) {
    return states[index];
  }

  void initializeStates() {
    states = List.filled(9, SquareState.N);
    for (int i = 0; i < moves.length; i++) {
      states[moves[i]] = (i % 2 == 0) ? SquareState.X : SquareState.O;
    }
  }

  bool isWinner(int index) {
    List<int> ws = winners() ?? [];
    return ws.contains(index); 
  }

  List<int> winners() {
    List<int> winningRow;

    for (List<int> r in toCheck) {
      SquareState first = states[r[0]];
      if (first == SquareState.N) {
        continue;
      }
      SquareState second = states[r[1]];
      if (second != first) {
        continue;
      }
      SquareState third = states[r[2]];
      if (third != second) {
        continue;
      }
      winningRow = List.from(r);
      break;
    }
    return winningRow;
  }
}
