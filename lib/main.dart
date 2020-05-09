import 'package:flutter/material.dart';
import 'package:tictactoe/board_brain.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TicTacToe(title: 'Tic Tac Toe'),
    );
  }
}

class TicTacToe extends StatelessWidget {
  final String title;
  TicTacToe({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Board(),
      ),
    );
  }
}

class Board extends StatefulWidget {
  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  List<int> moves = [];
  @override
  Widget build(BuildContext context) {
    BoardBrain brain = BoardBrain(moves);
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            square(0, 0, brain),
            square(0, 1, brain),
            square(0, 2, brain),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            square(1, 0, brain),
            square(1, 1, brain),
            square(1, 2, brain),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            square(2, 0, brain),
            square(2, 1, brain),
            square(2, 2, brain),
          ],
        ),
      ],
    ));
  }

  Square square(row, column, brain) {
    return Square(
        squareState: brain.state(row, column),
        onPress: () {
          makeMove(row, column);
        });
  }

  void makeMove(int row, int column) {
    setState(() {
      moves.add(3 * row + column);
    });
  }
}

class Square extends StatelessWidget {
  final onPress;
  final SquareState squareState;
  Square({this.squareState, this.onPress});

  @override
  Widget build(BuildContext context) {
    var color;
    var backgroundColor;
    var icon;
    backgroundColor = Colors.grey.shade200;
    if (squareState == SquareState.X) {
      color = Colors.red;
      icon = Icons.close;
    } else if (squareState == SquareState.O) {
      color = Colors.blue;
      icon = Icons.trip_origin;
    } else {
      color = Colors.white;
      icon = Icons.tv;
    }
    return FlatButton(
      onPressed: onPress,
      padding: EdgeInsets.all(0),
      child: Container(
        margin: EdgeInsets.all(5),
        height: 200,
        width: 200,
        color: backgroundColor,
        child: Center(
            child: Icon(
          icon,
          color: color,
          size: 200,
        )),
      ),
    );
  }
}
