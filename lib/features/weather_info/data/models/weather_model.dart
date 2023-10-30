import 'package:skywatch/core/resources/resources.dart';
import 'package:skywatch/features/weather_info/data/models/models.dart';
import 'package:skywatch/features/weather_info/domain/entities/entities.dart';

final class WeatherModel extends WeatherEntity {
  const WeatherModel({
    required super.city,
    required super.state,
    required super.country,
    required super.temperature,
    required super.condition,
    required super.iconPath,
    required super.windSpeed,
    required super.humidity,
    required super.isDay,
    required super.forecast,
  });

  factory WeatherModel.fromMap({required Map<String, dynamic> map}) {
    final String iconPath = map['current']['condition']['icon'];
    return WeatherModel(
      city: map['location']['name'],
      state: map['location']['region'],
      country: map['location']['country'],
      temperature: map['current']['temp_c'].toString(),
      condition: map['current']['condition']['text'],
      iconPath: '${IconPaths.weatherBasePath}${iconPath.substring(34)}',
      windSpeed: map['current']['wind_mph'].toString(),
      humidity: map['current']['humidity'].toString(),
      isDay: map['current']['is_day'] == 1,
      forecast: ForecastModel.fromMap(
        map: map['forecast']['forecastday'].first,
      ),
    );
  }
}
