import 'package:flutter_test/flutter_test.dart';
import 'package:skywatch/features/weather_info/data/models/forecast_model.dart';
import 'package:skywatch/features/weather_info/data/models/hourly_forecast_model.dart';

void main() {
  group('ForecastModel', () {
    test('should create a ForecastModel instance', () {
      final forecastModel = ForecastModel(
        maxTemperature: '30.0',
        minTemperature: '15.0',
        dailyChanceOfRain: '30',
        dailyChanceOfSnow: '5',
        hourlyForecastList: [],
      );

      expect(forecastModel.maxTemperature, '30.0');
      expect(forecastModel.minTemperature, '15.0');
      expect(forecastModel.dailyChanceOfRain, '30');
      expect(forecastModel.dailyChanceOfSnow, '5');
      expect(forecastModel.hourlyForecastList, []);
    });

    test('should create a ForecastModel from a map', () {
      final forecastMap = <String, dynamic>{
        'day': {
          'maxtemp_c': 30.0,
          'mintemp_c': 15.0,
          'daily_chance_of_rain': 30,
          'daily_chance_of_snow': 5,
        },
        'hour': [
          {
            "time": "2023-10-30 00:00",
            "temp_c": 11.1,
            "condition": {
              "text": "Partly cloudy",
              "icon": "//cdn.weatherapi.com/weather/64x64/night/116.png",
            },
          },
        ],
      };

      final forecastModel = ForecastModel.fromMap(map: forecastMap);

      expect(forecastModel.maxTemperature, '30.0');
      expect(forecastModel.minTemperature, '15.0');
      expect(forecastModel.dailyChanceOfRain, '30');
      expect(forecastModel.dailyChanceOfSnow, '5');
      expect(
          forecastModel.hourlyForecastList, isA<List<HourlyForecastModel>>());
    });
  });
}
