class WeatherModel {
  final temp;
  final pressure;
  final humidity;
  final temp_max;
  final temp_min;

  // Convertir Fahrenheit to Celsius
  double get getTempCel => temp - 272.5;

  double get getMaxTempCel => temp_max - 272.5;

  double get getMinTempCel => temp_min - 272.5;

  // Fahrenheit

  double get getTempFah => temp - 272.5;

  double get getMaxTempFah => temp_max - 272.5;

  double get getMinTempFah => temp_min - 272.5;

  WeatherModel(this.temp, this.pressure, this.humidity, this.temp_max, this.temp_min);

  // Pour map le contenu dans 'main' de l'api
  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(json["temp"], json["pressure"], json["humidity"],
        json["temp_max"], json["temp_min"]);
  }
}
