import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skywatch/core/errors/failures/failures.dart';
import 'package:skywatch/features/weather_info/data/models/models.dart';
import 'package:skywatch/features/weather_info/domain/usecases/usecases.dart';
import 'package:skywatch/features/weather_info/presentation/cubits/weather/weather_cubit.dart';

class MockGetCurrentPositionUsecase extends Mock
    implements GetCurrentPositionUsecase {}

class MockGetWeatherUsecase extends Mock implements GetWeatherUsecase {}

void main() {
  late WeatherCubit weatherCubit;
  late MockGetCurrentPositionUsecase mockGetCurrentPositionUsecase;
  late MockGetWeatherUsecase mockGetWeatherUsecase;

  setUp(() {
    mockGetCurrentPositionUsecase = MockGetCurrentPositionUsecase();
    mockGetWeatherUsecase = MockGetWeatherUsecase();
    weatherCubit = WeatherCubit(
      getCurrentPositionUsecase: mockGetCurrentPositionUsecase,
      getWeatherUsecase: mockGetWeatherUsecase,
    );
  });

  group('WeatherCubit', () {
    const currentPosition = CurrentPositionModel(
      latitude: '10.1234',
      longitude: '20.5678',
    );

    final weatherEntity = WeatherModel(
      city: 'Sample City',
      state: 'Sample State',
      country: 'Sample Country',
      temperature: '25.0',
      condition: 'Sunny',
      iconPath: 'path/to/icon',
      windSpeed: '5.0',
      humidity: '50',
      isDay: true,
      forecast: ForecastModel(
        maxTemperature: '30.0',
        minTemperature: '20.0',
        dailyChanceOfRain: '20%',
        dailyChanceOfSnow: '10%',
        hourlyForecastList: [],
      ),
    );

    blocTest<WeatherCubit, WeatherState>(
      'should emit the expected states when getting current position succeeds',
      build: () {
        when(() => mockGetCurrentPositionUsecase())
            .thenAnswer((_) async => const Right(currentPosition));
        return weatherCubit;
      },
      act: (cubit) => cubit.getCurrentPosition(),
      expect: () {
        verify(() => mockGetCurrentPositionUsecase()).called(1);
        return [
          WeatherLoadingState(),
          CurrentPositionLoadedState(currentPositionEntity: currentPosition),
        ];
      },
    );

    blocTest<WeatherCubit, WeatherState>(
      'should emit an error state when getting current position fails',
      build: () {
        when(() => mockGetCurrentPositionUsecase()).thenAnswer(
            (_) async => const Left(SkyWatchFailure(message: 'Error')));
        return weatherCubit;
      },
      act: (cubit) => cubit.getCurrentPosition(),
      expect: () {
        verify(() => mockGetCurrentPositionUsecase()).called(1);
        return [
          WeatherLoadingState(),
          CurrentPositionErrorState(message: 'Error'),
        ];
      },
    );

    blocTest<WeatherCubit, WeatherState>(
      'should emit the expected states when getting weather data succeeds',
      setUp: () {
        when(() => mockGetCurrentPositionUsecase())
            .thenAnswer((_) async => const Right(currentPosition));
        weatherCubit.getCurrentPosition();
      },
      build: () {
        when(() =>
                mockGetWeatherUsecase(currentPositionEntity: currentPosition))
            .thenAnswer((_) async => Right(weatherEntity));
        return weatherCubit;
      },
      act: (cubit) => cubit.getWeather(),
      expect: () {
        verify(() => mockGetCurrentPositionUsecase()).called(1);
        verify(() =>
                mockGetWeatherUsecase(currentPositionEntity: currentPosition))
            .called(1);
        return [
          WeatherLoadingState(),
          WeatherLoadedState(
            currentPositionEntity: currentPosition,
            weatherEntity: weatherEntity,
          ),
        ];
      },
    );

    blocTest<WeatherCubit, WeatherState>(
      'should emit an error state when getting weather data fails',
      setUp: () {
        when(() => mockGetCurrentPositionUsecase())
            .thenAnswer((_) async => const Right(currentPosition));
        weatherCubit.getCurrentPosition();
      },
      build: () {
        when(() => mockGetCurrentPositionUsecase())
            .thenAnswer((_) async => const Right(currentPosition));
        when(() =>
                mockGetWeatherUsecase(currentPositionEntity: currentPosition))
            .thenAnswer(
                (_) async => const Left(SkyWatchFailure(message: 'Error')));
        return weatherCubit;
      },
      act: (cubit) {
        cubit.getWeather();
      },
      expect: () {
        verify(() => mockGetCurrentPositionUsecase()).called(1);
        verify(() =>
                mockGetWeatherUsecase(currentPositionEntity: currentPosition))
            .called(1);
        return [
          WeatherLoadingState(),
          WeatherErrorState(
            message: 'Error',
            currentPositionEntity: currentPosition,
          ),
        ];
      },
    );
  });
}
