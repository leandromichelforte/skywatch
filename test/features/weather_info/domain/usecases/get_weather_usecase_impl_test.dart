import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skywatch/core/errors/failures/failures.dart';
import 'package:skywatch/features/weather_info/domain/entities/entities.dart';
import 'package:skywatch/features/weather_info/domain/repositories/repositories.dart';
import 'package:skywatch/features/weather_info/domain/usecases/usecases.dart';

class MockGetWeatherRepository extends Mock implements GetWeatherRepository {}

void main() {
  late GetWeatherUsecase usecase;
  late GetWeatherRepository repository;

  setUp(() {
    repository = MockGetWeatherRepository();
    usecase = GetWeatherUsecaseImpl(
      getWeatherRepository: repository,
    );
  });

  test('should call the repository to get weather data', () async {
    const currentPosition = CurrentPositionEntity(
      latitude: '10.1234',
      longitude: '20.5678',
    );

    const weatherEntity = WeatherEntity(
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
    );

    when(() => repository(currentPositionEntity: currentPosition))
        .thenAnswer((_) async => const Right(weatherEntity));

    final result = await usecase(currentPositionEntity: currentPosition);

    expect(result, const Right(weatherEntity));
    verify(() => repository(currentPositionEntity: currentPosition)).called(1);
  });

  test('should return a failure when an error occurs', () async {
    const failure = SkyWatchFailure(message: 'An error occurred');
    const currentPosition = CurrentPositionEntity(
      latitude: '10.1234',
      longitude: '20.5678',
    );

    when(() => repository(currentPositionEntity: currentPosition))
        .thenAnswer((_) async => const Left(failure));

    final result = await usecase(currentPositionEntity: currentPosition);

    expect(result, const Left(failure));
    verify(() => repository(currentPositionEntity: currentPosition)).called(1);
  });
}
