enum SquareState {
  X, // First Player
  O, // Second Player
  N, // Empty
}

class BoardBrain {
  final List<int> moves;
  List<SquareState> states;
  BoardBrain(this.moves) {
    initializeStates();
  }

  state(int row, int col) {
    int index = row * 3 + col;
    return states[index];
  }

  void initializeStates() {
    states = List.filled(9, SquareState.N);
    for (int i = 0; i < moves.length; i++) {
      states[moves[i]] = (i % 2 == 0) ? SquareState.X : SquareState.O;
    }
  }
}
