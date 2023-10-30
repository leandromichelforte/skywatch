import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skywatch/core/constants/constants.dart';
import 'package:skywatch/core/resources/resources.dart';
import 'package:skywatch/core/routes/named_routes.dart';
import 'package:skywatch/features/weather_info/domain/entities/entities.dart';
import 'package:skywatch/features/weather_info/presentation/cubits/weather/weather_cubit.dart';
import 'package:skywatch/features/weather_info/presentation/pages/weather_page.dart';
import 'package:skywatch/features/weather_info/presentation/widgets/weather_loaded_body_widget.dart';
import 'package:skywatch/core/shared_widgets/shared_widgets.dart';
import 'package:skywatch/features/weather_info/presentation/widgets/weather_loading_body_widget.dart';

import '../../../../core/core_mocktail.dart';

class MockWeatherCubit extends MockCubit<WeatherState>
    implements WeatherCubit {}

void main() {
  late MockWeatherCubit mockWeatherCubit;
  late NavigatorObserver navigatorObserver;

  setUp(() {
    mockWeatherCubit = MockWeatherCubit();
    navigatorObserver = MockNavigatorObserver();
  });

  setUpAll(() {
    registerFallbackValue(MockRoute());
  });

  testWidgets('WeatherPage should display correctly',
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
          iconPath: IconPaths.windIconPath,
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
          child: const WeatherPage(),
        ),
      ),
    );

    expect(find.text(WeatherStringsConstants.weather), findsOneWidget);
    expect(find.byType(PrimaryButtonWidget), findsOneWidget);
    expect(find.byType(WeatherLoadedBodyWidget), findsOneWidget);
  });

  testWidgets('WeatherPage should show loading body widget',
      (WidgetTester tester) async {
    when(() => mockWeatherCubit.state).thenReturn(WeatherLoadingState());

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<WeatherCubit>.value(
          value: mockWeatherCubit,
          child: const WeatherPage(),
        ),
      ),
    );

    expect(find.byType(WeatherLoadingBodyWidget), findsOneWidget);
  });

  testWidgets('WeatherPage should show current position error',
      (WidgetTester tester) async {
    when(() => mockWeatherCubit.state).thenReturn(
      CurrentPositionErrorState(message: 'Current Position Error'),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<WeatherCubit>.value(
          value: mockWeatherCubit,
          child: const WeatherPage(),
        ),
      ),
    );

    expect(find.byType(GeneralErrorWidget), findsOneWidget);
  });

  testWidgets('WeatherPage should show weather error',
      (WidgetTester tester) async {
    when(() => mockWeatherCubit.state).thenReturn(
      WeatherErrorState(
        message: 'Weather Error',
        currentPositionEntity: const CurrentPositionEntity(
          latitude: '0.0',
          longitude: '0.0',
        ),
      ),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<WeatherCubit>.value(
          value: mockWeatherCubit,
          child: const WeatherPage(),
        ),
      ),
    );

    expect(find.byType(GeneralErrorWidget), findsOneWidget);
  });

  testWidgets('WeatherPage should navigate to forecast',
      (WidgetTester tester) async {
    when(() => mockWeatherCubit.state).thenReturn(
      WeatherLoadedState(
        weatherEntity: const WeatherEntity(
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
            hourlyForecastList: [],
          ),
        ),
        currentPositionEntity:
            const CurrentPositionEntity(latitude: '20', longitude: '30'),
      ),
    );

    await tester.pumpWidget(
      MaterialApp(
        routes: {
          NamedRoutes.forecast: (context) => const SizedBox.shrink(),
        },
        navigatorObservers: [navigatorObserver],
        home: BlocProvider<WeatherCubit>.value(
          value: mockWeatherCubit,
          child: const WeatherPage(),
        ),
      ),
    );

    final button = find.byType(PrimaryButtonWidget);
    expect(button, findsOneWidget);

    await tester.tap(button);
    await tester.pumpAndSettle();
    verify(
      () => navigatorObserver.didPush(any(), any()),
    ).called(2);
  });
}
