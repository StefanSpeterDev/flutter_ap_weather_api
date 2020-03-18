import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:weather_api/WeatherModel.dart';

class WeatherRepo {
  //Appel de l'api
  Future<WeatherModel> getWeather(String city) async {
    final result = await http.Client().get(
        "http://api.openweathermap.org/data/2.5/weather?q=$city&APPID=3f523ff4f805dd24a5874463c2560975");

    // Check si l'api fonctionne : 200 means that it works
    if (result.statusCode != 200) throw Exception();

    return parsedJson(result.body);
  }

  // To convert the data received from the API to a dart object (here weather model)
  WeatherModel parsedJson(final response) {

    final jsonDecoded = json.decode(response);

    // Pour récupérer uniquement les valeurs contenus dans le main du fichier json de l'api
    final jsonWeather = jsonDecoded["main"];

    // fromJson est la méthode que l'on a crée dans le fichier WeatherModel
    return WeatherModel.fromJson(jsonWeather);

  }
}
