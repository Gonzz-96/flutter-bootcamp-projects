import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final player = AudioCache();

  Expanded _generateColorfulKey(int soundNumber, MaterialColor materialColor) =>
      Expanded(
        child: FlatButton(
          child: null,
          color: materialColor,
          onPressed: () {
            player.play('note$soundNumber.wav');
          },
        ),
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _generateColorfulKey(1, Colors.red),
              _generateColorfulKey(2, Colors.orange),
              _generateColorfulKey(3, Colors.yellow),
              _generateColorfulKey(4, Colors.lightGreen),
              _generateColorfulKey(5, Colors.green),
              _generateColorfulKey(6, Colors.blue),
              _generateColorfulKey(7, Colors.purple),
            ],
          ),
        ),
      ),
    );
  }
}
