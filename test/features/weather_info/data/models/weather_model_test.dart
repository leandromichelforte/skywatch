import 'package:flutter_test/flutter_test.dart';
import 'package:skywatch/features/weather_info/data/models/forecast_model.dart';
import 'package:skywatch/features/weather_info/data/models/weather_model.dart';

void main() {
  group('WeatherModel', () {
    test('should create a WeatherModel from a map', () {
      final weatherMap = {
        'location': {
          'name': 'CityName',
          'region': 'StateName',
          'country': 'CountryName',
        },
        'current': {
          'temp_c': 30.0,
          'condition': {
            'text': 'Partly Cloudy',
            'icon': '//cdn.weatherapi.com/weather/64x64/night/116.png',
          },
          'wind_mph': 5.0,
          'humidity': 65.0,
          'is_day': 1,
        },
        'forecast': {
          'forecastday': [
            {
              'day': {
                'maxtemp_c': 35.0,
                'mintemp_c': 25.0,
                'daily_chance_of_rain': '20',
                'daily_chance_of_snow': '10',
              },
              'hour': [],
            },
          ],
        },
      };

      final weatherModel = WeatherModel.fromMap(map: weatherMap);

      expect(weatherModel.city, 'CityName');
      expect(weatherModel.state, 'StateName');
      expect(weatherModel.country, 'CountryName');
      expect(weatherModel.temperature, '30.0');
      expect(weatherModel.condition, 'Partly Cloudy');
      expect(
        weatherModel.iconPath,
        'assets/icons/weather/night/116.png',
      );
      expect(weatherModel.windSpeed, '5.0');
      expect(weatherModel.humidity, '65.0');
      expect(weatherModel.isDay, true);
      expect(weatherModel.forecast, isA<ForecastModel>());
    });
  });
}
