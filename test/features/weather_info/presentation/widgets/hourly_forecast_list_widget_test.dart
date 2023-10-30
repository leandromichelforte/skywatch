import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:skywatch/core/resources/resources.dart';
import 'package:skywatch/features/weather_info/presentation/widgets/hourly_forecast_list_widget.dart';
import 'package:skywatch/features/weather_info/domain/entities/entities.dart';

void main() {
  testWidgets('HourlyForecastListWidget should display correctly',
      (WidgetTester tester) async {
    const weatherEntity = WeatherEntity(
      city: 'Sample City',
      state: 'Sample State',
      country: 'Sample Country',
      temperature: '25.0',
      condition: 'Sunny',
      iconPath: IconPaths.windIconPath,
      windSpeed: '5.0',
      humidity: '50',
      isDay: true,
      forecast: ForecastEntity(
        maxTemperature: '30.0',
        minTemperature: '20.0',
        dailyChanceOfRain: '20%',
        dailyChanceOfSnow: '10%',
        hourlyForecastList: [
          HourlyForecastEntity(
            time: '2023-10-31 12:00:00',
            temperature: '27.0',
            condition: 'Sunny',
            iconPath: IconPaths.windIconPath,
          ),
          HourlyForecastEntity(
            time: '2023-10-31 13:00:00',
            temperature: '28.0',
            condition: 'Partly cloudy',
            iconPath: IconPaths.windIconPath,
          ),
        ],
      ),
    );

    await tester.pumpWidget(
      const MaterialApp(
        home: HourlyForecastListWidget(
          weatherEntity: weatherEntity,
        ),
      ),
    );

    expect(find.text('Sunny'), findsOneWidget);

    expect(find.text('Partly cloudy'), findsOneWidget);
  });
}
