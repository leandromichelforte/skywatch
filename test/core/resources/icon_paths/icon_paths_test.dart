import 'package:flutter_test/flutter_test.dart';
import 'package:skywatch/core/resources/icon_paths/icon_paths.dart';

void main() {
  test('should return the correct weatherBasePath', () {
    expect(IconPaths.weatherBasePath, 'assets/icons/weather');
  });

  test('should return the correct humidityIconPath', () {
    expect(
        IconPaths.humidityIconPath, 'assets/icons/weather/humidity_icon.png');
  });

  test('should return the correct locationIconPath', () {
    expect(
        IconPaths.locationIconPath, 'assets/icons/weather/location_icon.png');
  });

  test('should return the correct windIconPath', () {
    expect(IconPaths.windIconPath, 'assets/icons/weather/wind_icon.png');
  });

  test('should return the correct celsiusIconPath', () {
    expect(IconPaths.celsiusIconPath, 'assets/icons/weather/celsius_icon.png');
  });

  test('should return the correct thermometerIconPath', () {
    expect(IconPaths.thermometerIconPath,
        'assets/icons/weather/thermometer_icon.png');
  });

  test('should return the correct maxTempIconPath', () {
    expect(IconPaths.maxTempIconPath, 'assets/icons/weather/max_temp_icon.png');
  });

  test('should return the correct minTempIconPath', () {
    expect(IconPaths.minTempIconPath, 'assets/icons/weather/min_temp_icon.png');
  });

  test('should return the correct rainIconPath', () {
    expect(IconPaths.rainIconPath, 'assets/icons/weather/rain_icon.png');
  });

  test('should return the correct snowIconPath', () {
    expect(IconPaths.snowIconPath, 'assets/icons/weather/snow_icon.png');
  });

  test('should return the correct logo', () {
    expect(IconPaths.logo, 'assets/icons/logo.png');
  });
  test('should return the correct emptyIconPath', () {
    expect(IconPaths.emptyIconPath, 'assets/icons/empty_icon.png');
  });
}
