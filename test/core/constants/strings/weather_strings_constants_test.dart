import 'package:flutter_test/flutter_test.dart';
import 'package:skywatch/core/constants/strings/weather_strings_constants.dart';

void main() {
  test('should return View Weather', () {
    expect(WeatherStringsConstants.viewWeather, 'View Weather');
  });

  test('should return Weather', () {
    expect(WeatherStringsConstants.weather, 'Weather');
  });

  test('should return Forecast', () {
    expect(WeatherStringsConstants.forecast, 'Forecast');
  });
}
