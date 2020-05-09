import 'package:test/test.dart';
import 'package:tictactoe/board_brain.dart';

void main() {
  test('Board brain should know square states from moves.', () {
    final boardBrain = BoardBrain([1, 2, 5]);
    expect(boardBrain.state(0), SquareState.N);
    expect(boardBrain.state(1), SquareState.X);
    expect(boardBrain.state(2), SquareState.O);
    expect(boardBrain.state(3), SquareState.N);
    expect(boardBrain.state(4), SquareState.N);
    expect(boardBrain.state(5), SquareState.X);
    expect(boardBrain.state(6), SquareState.N);
    expect(boardBrain.state(7), SquareState.N);
    expect(boardBrain.state(8), SquareState.N);
  });
  test('Winning Rows recognized.', () {
    BoardBrain boardBrain = BoardBrain([0, 8, 1, 7, 2]);
    expect(boardBrain.winners(), [0, 1, 2]);

    boardBrain = BoardBrain([]);
    expect(boardBrain.winners(), null);

    boardBrain = BoardBrain([0, 8, 3, 7, 6]);
    expect(boardBrain.winners(), [0, 3, 6]);
  });
}
