import 'package:flutter_test/flutter_test.dart';
import 'package:skywatch/features/weather_info/data/models/hourly_forecast_model.dart';

void main() {
  group('HourlyForecastModel', () {
    test('should create a HourlyForecastModel instance', () {
      const hourlyForecastModel = HourlyForecastModel(
        time: '12:00 AM',
        temperature: '30.0',
        condition: 'Partly Cloudy',
        iconPath: 'assets/icons/weather/partly_cloudy.png',
      );

      expect(hourlyForecastModel.time, '12:00 AM');
      expect(hourlyForecastModel.temperature, '30.0');
      expect(hourlyForecastModel.condition, 'Partly Cloudy');
      expect(hourlyForecastModel.iconPath,
          'assets/icons/weather/partly_cloudy.png');
    });

    test('should create a HourlyForecastModel from a map', () {
      final hourlyForecastMap = {
        'time': '12:00 AM',
        'temp_c': 30.0,
        'condition': {
          'text': 'Partly Cloudy',
          'icon': '//cdn.weatherapi.com/weather/64x64/night/116.png',
        },
      };

      final hourlyForecastModel =
          HourlyForecastModel.fromMap(map: hourlyForecastMap);

      expect(hourlyForecastModel.time, '12:00 AM');
      expect(hourlyForecastModel.temperature, '30.0');
      expect(hourlyForecastModel.condition, 'Partly Cloudy');
      expect(
        hourlyForecastModel.iconPath,
        'assets/icons/weather/night/116.png',
      );
    });
  });
}
