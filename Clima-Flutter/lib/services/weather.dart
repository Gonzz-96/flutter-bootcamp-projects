import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const kApiKey = 'cdf5282dd89aa24059633965eec07819';
const kUnit = 'metric';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    String url = 'https://api.openweathermap.org/data/2.5/weather' +
        '?lat=${location.latitude}&lon=${location.longitude}&appid=$kApiKey&units=$kUnit';

    var weatherData = await NetworkHelper(url: url).getData();
    return weatherData;
  }

  Future<dynamic> getCityWeather(String cityName) async {
    String url = 'https://api.openweathermap.org/data/2.5/weather' +
        '?q=$cityName&appid=$kApiKey&units=$kUnit';

    var weatherData = await NetworkHelper(url: url).getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
