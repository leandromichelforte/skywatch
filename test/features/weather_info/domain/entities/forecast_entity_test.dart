import 'package:flutter_test/flutter_test.dart';
import 'package:skywatch/features/weather_info/domain/entities/entities.dart';

void main() {
  test('should have correct properties, be equal, and have the same hashCode',
      () {
    const maxTemperature = '25';
    const minTemperature = '15';
    const dailyChanceOfRain = '30';
    const dailyChanceOfSnow = '5';
    final hourlyForecastList = <HourlyForecastEntity>[
      const HourlyForecastEntity(
          time: '12:00',
          temperature: '20',
          condition: 'Sunny',
          iconPath: 'sunny.png'),
      const HourlyForecastEntity(
          time: '15:00',
          temperature: '22',
          condition: 'Cloudy',
          iconPath: 'cloudy.png'),
    ];

    final entity1 = ForecastEntity(
      maxTemperature: maxTemperature,
      minTemperature: minTemperature,
      dailyChanceOfRain: dailyChanceOfRain,
      dailyChanceOfSnow: dailyChanceOfSnow,
      hourlyForecastList: hourlyForecastList,
    );
    const entity2 = ForecastEntity(
      maxTemperature: '25',
      minTemperature: '15',
      dailyChanceOfRain: '30',
      dailyChanceOfSnow: '5',
      hourlyForecastList: <HourlyForecastEntity>[
        HourlyForecastEntity(
            time: '12:00',
            temperature: '20',
            condition: 'Sunny',
            iconPath: 'sunny.png'),
        HourlyForecastEntity(
            time: '15:00',
            temperature: '22',
            condition: 'Cloudy',
            iconPath: 'cloudy.png'),
      ],
    );

    expect(entity1, entity2);
    expect(entity1.hashCode, entity2.hashCode);

    expect(entity1.maxTemperature, maxTemperature);
    expect(entity1.minTemperature, minTemperature);
    expect(entity1.dailyChanceOfRain, dailyChanceOfRain);
    expect(entity1.dailyChanceOfSnow, dailyChanceOfSnow);
    expect(entity1.hourlyForecastList, hourlyForecastList);
  });
}
