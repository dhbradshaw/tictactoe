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
        child: FittedBox(
          child: Board(),
          fit: BoxFit.contain,
        ),
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
            square(0, brain),
            square(1, brain),
            square(2, brain),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            square(3, brain),
            square(4, brain),
            square(5, brain),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            square(6, brain),
            square(7, brain),
            square(8, brain),
          ],
        ),
      ],
    ));
  }

  Square square(int index, BoardBrain brain) {
    return Square(
        squareState: brain.state(index),
        isWinner: brain.isWinner(index),
        onPress: () {
          if (moves.contains(index) == false) {
            setState(() {
              moves.add(index);
            });
          }
        });
  }
}

class Square extends StatelessWidget {
  final onPress;
  final SquareState squareState;
  final bool isWinner;
  Square({this.squareState, this.onPress, this.isWinner});

  @override
  Widget build(BuildContext context) {
    var color;
    var backgroundColor;
    var icon;
    backgroundColor = isWinner ? Colors.grey.shade300 : Colors.grey.shade200;
    if (squareState == SquareState.X) {
      color = Colors.red;
      icon = Icons.close;
    } else if (squareState == SquareState.O) {
      color = Colors.blue;
      icon = Icons.trip_origin;
    } else {
      color = Colors.white;
      // icon = Icons.tv;
    }
    return FlatButton(
      onPressed: onPress,
      padding: EdgeInsets.all(0),
      child: Container(
        margin: EdgeInsets.all(5),
        height: 300,
        width: 300,
        color: backgroundColor,
        child: FittedBox(
          fit: BoxFit.contain,
          child: Icon(
            icon,
            color: color,
            size: 500,
          ),
        ),
      ),
    );
  }
}
