import 'package:skywatch/core/resources/resources.dart';
import 'package:skywatch/features/weather_info/domain/entities/entities.dart';

final class HourlyForecastModel extends HourlyForecastEntity {
  const HourlyForecastModel({
    required super.time,
    required super.temperature,
    required super.condition,
    required super.iconPath,
  });

  factory HourlyForecastModel.fromMap({required Map<String, dynamic> map}) {
    final String iconPath = map['condition']['icon'];
    return HourlyForecastModel(
      time: map['time'],
      temperature: map['temp_c'].toString(),
      condition: map['condition']['text'],
      iconPath: '${IconPaths.weatherBasePath}${iconPath.substring(34)}',
    );
  }
}
