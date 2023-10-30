base class HourlyForecastEntity {
  const HourlyForecastEntity({
    required this.time,
    required this.temperature,
    required this.condition,
    required this.iconPath,
  });
  final String time;
  final String temperature;
  final String condition;
  final String iconPath;

  @override
  bool operator ==(Object other) {
    return other is HourlyForecastEntity &&
        other.time == time &&
        other.temperature == temperature &&
        other.condition == condition &&
        other.iconPath == iconPath;
  }

  @override
  int get hashCode =>
      time.hashCode ^
      temperature.hashCode ^
      condition.hashCode ^
      iconPath.hashCode;
}
