import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'genre.dart';

class IconContent extends StatelessWidget {
  IconContent({@required this.cardGenre});

  final Genre cardGenre;

  @override
  Widget build(BuildContext context) {
    Icon genreIcon;
    String genreText;

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
