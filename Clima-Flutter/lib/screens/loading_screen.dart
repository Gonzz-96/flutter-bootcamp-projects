import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';

const kApiKey = 'cdf5282dd89aa24059633965eec07819';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  void getLocationData() async {
    Location locationObject = Location();
    await locationObject.getCurrentLocation();

    latitude = locationObject.latitude;
    longitude = locationObject.longitude;

    var url = 'https://api.openweathermap.org/data/2.5/' +
        'weather?lat=$latitude&lon=$longitude&appid=$kApiKey';

    var weatherData = await NetworkHelper(url: url).getData();
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
