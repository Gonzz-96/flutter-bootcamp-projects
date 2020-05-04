import 'package:http/http.dart' as http;
import 'dart:convert';

const kApiKey = '3B71A80A-726C-48FB-BA2D-43483FCD6F2F';
const kBaseUrl = 'https://rest.coinapi.io/';

const kExchangeRateEndpoint = '${kBaseUrl}v1/exchangerate/';

class CurrencyDataSource {
  Future<double> getExchangeRate(
      String baseCurrency, String destinationCurrency) async {
    var finalUrl = '$kExchangeRateEndpoint' +
        '$baseCurrency/$destinationCurrency' +
        '?apikey=$kApiKey';

    var rawData = await http.get(finalUrl);

    if (rawData.statusCode == 200) {
      var parsedData = jsonDecode(rawData.body);

      return parsedData['rate'] as double;
    }

    return 0;
  }
}
