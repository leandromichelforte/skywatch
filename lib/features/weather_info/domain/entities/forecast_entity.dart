import 'package:flutter/foundation.dart';
import 'package:skywatch/features/weather_info/domain/entities/entities.dart';

base class ForecastEntity {
  const ForecastEntity({
    required this.maxTemperature,
    required this.minTemperature,
    required this.dailyChanceOfRain,
    required this.dailyChanceOfSnow,
    required this.hourlyForecastList,
  });
  final String maxTemperature;
  final String minTemperature;
  final String dailyChanceOfRain;
  final String dailyChanceOfSnow;
  final List<HourlyForecastEntity> hourlyForecastList;

  @override
  bool operator ==(Object other) {
    return other is ForecastEntity &&
        other.maxTemperature == maxTemperature &&
        other.minTemperature == minTemperature &&
        other.dailyChanceOfRain == dailyChanceOfRain &&
        other.dailyChanceOfSnow == dailyChanceOfSnow &&
        listEquals(other.hourlyForecastList, hourlyForecastList);
  }

  @override
  int get hashCode =>
      maxTemperature.hashCode ^
      minTemperature.hashCode ^
      dailyChanceOfRain.hashCode ^
      dailyChanceOfSnow.hashCode ^
      Object.hashAll(hourlyForecastList);
}
