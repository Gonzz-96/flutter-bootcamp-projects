import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String currentCurrency = 'USD';

  CupertinoPicker getCupertinoPicker() => CupertinoPicker(
        backgroundColor: Colors.lightBlue,
        children: _generateCupertinoMenuItems(),
        itemExtent: 32.0,
        onSelectedItemChanged: (selectedIndex) {
          print("$selectedIndex: ${currenciesList[selectedIndex]}");
        },
      );

  List<Widget> _generateCupertinoMenuItems() => currenciesList.map((currency) {
        return Text(
          currency,
          style: TextStyle(
            color: Colors.white,
          ),
        );
      }).toList();

  DropdownButton<String> getDropDownButton() => DropdownButton<String>(
        items: _generateDropdownMenuItems(),
        value: currentCurrency ?? "",
        onChanged: (value) {
          setState(() {
            currentCurrency = value;
          });
        },
      );

  List<DropdownMenuItem<String>> _generateDropdownMenuItems() =>
      currenciesList.map((currency) {
        return DropdownMenuItem(
          value: currency,
          child: Text(currency),
        );
      }).toList();

  Widget getSpecificPicker() {
    if (Platform.isIOS) {
      return getCupertinoPicker();
    } else {
      return getDropDownButton();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: getSpecificPicker(),
          ),
        ],
      ),
    );
  }
}
