import 'package:skywatch/features/weather_info/domain/entities/entities.dart';

base class WeatherEntity {
  const WeatherEntity({
    required this.city,
    required this.state,
    required this.country,
    required this.temperature,
    required this.condition,
    required this.iconPath,
    required this.windSpeed,
    required this.humidity,
    required this.isDay,
    required this.forecast,
  });
  final String city;
  final String state;
  final String country;
  final String temperature;
  final String condition;
  final String iconPath;
  final String windSpeed;
  final String humidity;
  final bool isDay;
  final ForecastEntity forecast;

  @override
  bool operator ==(Object other) {
    return other is WeatherEntity &&
        other.city == city &&
        other.state == state &&
        other.country == country &&
        other.temperature == temperature &&
        other.condition == condition &&
        other.iconPath == iconPath &&
        other.windSpeed == windSpeed &&
        other.humidity == humidity &&
        other.isDay == isDay &&
        other.forecast == forecast;
  }

  @override
  int get hashCode =>
      city.hashCode ^
      state.hashCode ^
      country.hashCode ^
      temperature.hashCode ^
      condition.hashCode ^
      iconPath.hashCode ^
      windSpeed.hashCode ^
      humidity.hashCode ^
      isDay.hashCode ^
      forecast.hashCode;
}
