import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';

import 'genre.dart';
import 'icon_content.dart';

const ACTIVE_CARD_COLOR = Color(0xFF1D1E33);
const INACTIVE_CARD_COLOR = Color(0xff111328);
const CALCULATE_BUTTON_COLOR = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Genre selectedGender;

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
                    child: IconContent(cardGenre: Genre.male),
                    cardColor: selectedGender == Genre.male
                        ? ACTIVE_CARD_COLOR
                        : INACTIVE_CARD_COLOR,
                    onPress: () {
                      setState(() {
                        selectedGender = Genre.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    child: IconContent(cardGenre: Genre.female),
                    cardColor: selectedGender == Genre.female
                        ? ACTIVE_CARD_COLOR
                        : INACTIVE_CARD_COLOR,
                    onPress: () {
                      setState(() {
                        selectedGender = Genre.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardColor: ACTIVE_CARD_COLOR,
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    cardColor: ACTIVE_CARD_COLOR,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardColor: ACTIVE_CARD_COLOR,
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
