import 'package:flutter/material.dart';

const CARD_PRIMARY_COLOR = Color(0xFF1D1E33);
const CALCULATE_BUTTON_COLOR = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    cardColor: CARD_PRIMARY_COLOR,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardColor: CARD_PRIMARY_COLOR,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardColor: CARD_PRIMARY_COLOR,
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    cardColor: CARD_PRIMARY_COLOR,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardColor: CARD_PRIMARY_COLOR,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: CALCULATE_BUTTON_COLOR,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: 80.0,
          ),
        ],
      ),
    );
  }
}

// CONST: it's a IMMUTABLE COMPILE TIME variable
// FINAL: it's only an IMMUTABLE variable.
// CONST implies FINAL, but CONST is static

class ReusableCard extends StatelessWidget {
  final Color cardColor;

  ReusableCard({@required this.cardColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: cardColor,
      ),
    );
  }
}
