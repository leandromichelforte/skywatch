import 'package:skywatch/features/weather_info/data/models/models.dart';
import 'package:skywatch/features/weather_info/domain/entities/entities.dart';

final class ForecastModel extends ForecastEntity {
  ForecastModel({
    required super.maxTemperature,
    required super.minTemperature,
    required super.dailyChanceOfRain,
    required super.dailyChanceOfSnow,
    required super.hourlyForecastList,
  });

  factory ForecastModel.fromMap({required Map<String, dynamic> map}) =>
      ForecastModel(
        maxTemperature: map['day']['maxtemp_c'].toString(),
        minTemperature: map['day']['mintemp_c'].toString(),
        dailyChanceOfRain: map['day']['daily_chance_of_rain'].toString(),
        dailyChanceOfSnow: map['day']['daily_chance_of_snow'].toString(),
        hourlyForecastList: map['hour']
            .map<HourlyForecastModel>(
                (elementMap) => HourlyForecastModel.fromMap(map: elementMap))
            .toList(),
      );
}
