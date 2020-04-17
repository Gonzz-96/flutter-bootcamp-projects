import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final player = AudioCache();

  FlatButton _generateFlatButton(
          int soundNumber, MaterialColor materialColor) =>
      FlatButton(
        child: null,
        color: materialColor,
        onPressed: () {
          player.play('note$soundNumber.wav');
        },
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              _generateFlatButton(1, Colors.red),
              _generateFlatButton(2, Colors.orange),
              _generateFlatButton(3, Colors.yellow),
              _generateFlatButton(4, Colors.lightGreen),
              _generateFlatButton(5, Colors.green),
              _generateFlatButton(6, Colors.blue),
              _generateFlatButton(7, Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}
