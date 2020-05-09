import 'package:test/test.dart';
import 'package:tictactoe/board_brain.dart';

void main() {
  test('Board brain should know square states from moves.', () {
    final boardBrain = BoardBrain([1, 2, 5]);
    expect(boardBrain.state(0, 0), SquareState.N);
    expect(boardBrain.state(0, 1), SquareState.X);
    expect(boardBrain.state(0, 2), SquareState.O);
    expect(boardBrain.state(1, 0), SquareState.N);
    expect(boardBrain.state(1, 1), SquareState.N);
    expect(boardBrain.state(1, 2), SquareState.X);
    expect(boardBrain.state(2, 0), SquareState.N);
    expect(boardBrain.state(2, 1), SquareState.N);
    expect(boardBrain.state(2, 2), SquareState.N);
  });
}