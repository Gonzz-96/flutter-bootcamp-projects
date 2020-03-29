import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  var leftDiceNumber = 1;
  var rightDiceNumber = 1;

  void changeDicesFaces() {
    setState(() {
      leftDiceNumber = getRandomNumber();
      rightDiceNumber = getRandomNumber();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: () {
                // void callback (lambda)
                setState(() {
                  changeDicesFaces();
                });
              },
              child: Image.asset('images/dice$leftDiceNumber.png'),
            ),
          ),
          Expanded(
            child: FlatButton(
              child: Image.asset('images/dice$rightDiceNumber.png'),
              onPressed: () {
                // void callback (lambda)
                setState(() {
                  changeDicesFaces();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

int getRandomNumber() => Random().nextInt(6) + 1;

// To match the content of an images
// that goes out of the screen
// we can use "Expanded" class in a Row, Column of Flex
// Expanded class can specify the space
// used for one element in the Row (like weight in android)
// We can use flex: propery

// Stateless widget won't change (they're immutable)
