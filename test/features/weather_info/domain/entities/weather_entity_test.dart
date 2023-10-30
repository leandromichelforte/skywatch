import 'package:flutter_test/flutter_test.dart';
import 'package:skywatch/features/weather_info/domain/entities/entities.dart';

void main() {
  test('should have correct properties, be equal, and have the same hashCode',
      () {
    const city = 'New York';
    const state = 'NY';
    const country = 'USA';
    const temperature = '25';
    const condition = 'Sunny';
    const iconPath = 'sunny.png';
    const windSpeed = '10';
    const humidity = '50';
    const isDay = true;

    const forecast = ForecastEntity(
      maxTemperature: '30',
      minTemperature: '20',
      dailyChanceOfRain: '20',
      dailyChanceOfSnow: '5',
      hourlyForecastList: [],
    );

    const entity1 = WeatherEntity(
      city: city,
      state: state,
      country: country,
      temperature: temperature,
      condition: condition,
      iconPath: iconPath,
      windSpeed: windSpeed,
      humidity: humidity,
      isDay: isDay,
      forecast: forecast,
    );

    const entity2 = WeatherEntity(
      city: 'New York',
      state: 'NY',
      country: 'USA',
      temperature: '25',
      condition: 'Sunny',
      iconPath: 'sunny.png',
      windSpeed: '10',
      humidity: '50',
      isDay: true,
      forecast: ForecastEntity(
        maxTemperature: '30',
        minTemperature: '20',
        dailyChanceOfRain: '20',
        dailyChanceOfSnow: '5',
        hourlyForecastList: [],
      ),
    );

    expect(entity1, entity2);
    expect(entity1.hashCode, entity2.hashCode);

    expect(entity1.city, city);
    expect(entity1.state, state);
    expect(entity1.country, country);
    expect(entity1.temperature, temperature);
    expect(entity1.condition, condition);
    expect(entity1.iconPath, iconPath);
    expect(entity1.windSpeed, windSpeed);
    expect(entity1.humidity, humidity);
    expect(entity1.isDay, isDay);
    expect(entity1.forecast, forecast);
  });
}
