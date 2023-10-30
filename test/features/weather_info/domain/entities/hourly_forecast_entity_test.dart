import 'package:flutter_test/flutter_test.dart';
import 'package:skywatch/features/weather_info/domain/entities/entities.dart';

void main() {
  test('should have correct properties, be equal, and have the same hashCode',
      () {
    const time = '12:00';
    const temperature = '20';
    const condition = 'Sunny';
    const iconPath = 'sunny.png';

    const entity1 = HourlyForecastEntity(
      time: time,
      temperature: temperature,
      condition: condition,
      iconPath: iconPath,
    );
    const entity2 = HourlyForecastEntity(
      time: '12:00',
      temperature: '20',
      condition: 'Sunny',
      iconPath: 'sunny.png',
    );

    expect(entity1, entity2);
    expect(entity1.hashCode, entity2.hashCode);

    expect(entity1.time, time);
    expect(entity1.temperature, temperature);
    expect(entity1.condition, condition);
    expect(entity1.iconPath, iconPath);
  });
}
