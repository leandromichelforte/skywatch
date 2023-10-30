import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skywatch/core/constants/constants.dart';
import 'package:skywatch/features/weather_info/domain/entities/entities.dart';
import 'package:skywatch/features/weather_info/presentation/cubits/weather/weather_cubit.dart';
import 'package:skywatch/features/weather_info/presentation/pages/forecast_page.dart';
import 'package:skywatch/features/weather_info/presentation/widgets/hourly_forecast_list_widget.dart';

class MockWeatherCubit extends MockCubit<WeatherState>
    implements WeatherCubit {}

void main() {
  late MockWeatherCubit mockWeatherCubit;

  setUp(() {
    mockWeatherCubit = MockWeatherCubit();
  });

  testWidgets('ForecastPage should display correctly',
      (WidgetTester tester) async {
    when(() => mockWeatherCubit.state).thenReturn(
      WeatherLoadedState(
        currentPositionEntity:
            const CurrentPositionEntity(latitude: '20', longitude: '30'),
        weatherEntity: const WeatherEntity(
          city: 'Sample City',
          state: 'Sample State',
          country: 'Sample Country',
          temperature: '25.0',
          condition: 'Sunny',
          iconPath: 'path/to/icon',
          windSpeed: '5.0',
          humidity: '50',
          isDay: true,
          forecast: ForecastEntity(
            maxTemperature: '30.0',
            minTemperature: '20.0',
            dailyChanceOfRain: '20%',
            dailyChanceOfSnow: '10%',
            hourlyForecastList: [],
          ),
        ),
      ),
    );
    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<WeatherCubit>.value(
          value: mockWeatherCubit,
          child: const ForecastPage(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text(WeatherStringsConstants.forecast), findsOneWidget);
    expect(find.byType(HourlyForecastListWidget), findsOneWidget);
  });
}
