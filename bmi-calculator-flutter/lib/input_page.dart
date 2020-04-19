import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                    child: _GenreCardContent(cardGenre: Genre.male),
                    cardColor: CARD_PRIMARY_COLOR,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    child: _GenreCardContent(cardGenre: Genre.female),
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
  final Widget child;

  ReusableCard({@required this.cardColor, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: cardColor,
      ),
    );
  }
}

class _GenreCardContent extends StatelessWidget {
  _GenreCardContent({@required this.cardGenre});

  Genre cardGenre;
  Icon genreIcon;
  String genreText;

  @override
  Widget build(BuildContext context) {
    if (cardGenre == Genre.male) {
      genreIcon = Icon(
        FontAwesomeIcons.mars,
        size: 80.0,
      );
      genreText = "MALE";
    } else {
      genreIcon = Icon(
        FontAwesomeIcons.venus,
        size: 80.0,
      );
      genreText = "FEMALE";
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        genreIcon,
        SizedBox(
          height: 15.0,
        ),
        Text(
          genreText,
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0xFF8D8E98),
          ),
        )
      ],
    );
  }
}

enum Genre {
  male,
  female,
}
