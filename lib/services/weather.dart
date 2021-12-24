import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey = '360d3f2d6b89bc43d964d862d1b2f873';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getWeather(String cityName) async {
    Networking network =
        Networking('$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');
    var weatherData = await network.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location loc = Location();
    await loc.getCurrentLocation();

    Networking network = Networking(
        '$openWeatherMapURL?lat=${loc.latitude}&lon=${loc.longitude}&appid=$apiKey&units=metric');

    var weatherData = await network.getData();

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
    if (temp > 35) {
      return 'Wear loose 👕 and drink lot of water';
    } else if (temp > 25) {
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
