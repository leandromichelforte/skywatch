import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skywatch/core/constants/strings/strings.dart';
import 'package:skywatch/core/errors/exceptions/exceptions.dart';
import 'package:skywatch/core/errors/failures/failures.dart';
import 'package:skywatch/features/weather_info/data/datasources/datasources.dart';
import 'package:skywatch/features/weather_info/data/repositories/get_weather_repository_impl.dart';
import 'package:skywatch/features/weather_info/domain/entities/entities.dart';
import 'package:skywatch/features/weather_info/data/models/models.dart';

class MockGetWeatherDatasource extends Mock implements GetWeatherDatasource {}

void main() {
  late GetWeatherRepositoryImpl repository;
  late MockGetWeatherDatasource mockDatasource;

  setUp(() {
    mockDatasource = MockGetWeatherDatasource();
    repository = GetWeatherRepositoryImpl(getWeatherDatasource: mockDatasource);
  });

  setUpAll(() {
    registerFallbackValue(
        const CurrentPositionModel(latitude: '50', longitude: '50'));
  });

  group('GetWeatherRepository', () {
    const currentPositionEntity = CurrentPositionEntity(
      latitude: '12.345',
      longitude: '67.890',
    );

    final weatherModel = WeatherModel(
      city: 'City',
      state: 'State',
      country: 'Country',
      temperature: '25.0',
      condition: 'Sunny',
      iconPath: 'icon.png',
      windSpeed: '10.0',
      humidity: '50',
      isDay: true,
      forecast: ForecastModel(
        maxTemperature: '30.0',
        minTemperature: '20.0',
        dailyChanceOfRain: '30%',
        dailyChanceOfSnow: '10%',
        hourlyForecastList: [],
      ),
    );

    test('should return WeatherModel from datasource', () async {
      when(() => mockDatasource(
            currentPositionModel: any(named: 'currentPositionModel'),
          )).thenAnswer((_) async => weatherModel);
      final result =
          await repository(currentPositionEntity: currentPositionEntity);
      expect(result, Right(weatherModel));
      verify(() => mockDatasource(
            currentPositionModel: any(named: 'currentPositionModel'),
          )).called(1);
    });

    test('should return SkyWatchFailure on ApiException', () async {
      when(() => mockDatasource(
            currentPositionModel: any(named: 'currentPositionModel'),
          )).thenThrow(const ApiException(error: Object()));
      final result =
          await repository(currentPositionEntity: currentPositionEntity);
      expect(
          result,
          const Left(SkyWatchFailure(
              message: SharedStringsConstants
                  .somethingWentWrongFethingYourVideosTryAgain)));
      verify(() => mockDatasource(
            currentPositionModel: any(named: 'currentPositionModel'),
          )).called(1);
    });
    test('should return SkyWatchFailure on ConnectionException', () async {
      when(() => mockDatasource(
            currentPositionModel: any(named: 'currentPositionModel'),
          )).thenThrow(const ConnectionException(error: Object()));
      final result =
          await repository(currentPositionEntity: currentPositionEntity);
      expect(
          result,
          const Left(SkyWatchFailure(
              message: SharedStringsConstants.checkYourConnectionAndTryAgain)));
      verify(() => mockDatasource(
            currentPositionModel: any(named: 'currentPositionModel'),
          )).called(1);
    });
    test('should return SkyWatchFailure on GenericException', () async {
      when(() => mockDatasource(
                currentPositionModel: any(named: 'currentPositionModel'),
              ))
          .thenThrow(const GenericException(error: Object(), message: 'Error'));
      final result =
          await repository(currentPositionEntity: currentPositionEntity);
      expect(result, const Left(SkyWatchFailure(message: 'Error')));
      verify(() => mockDatasource(
            currentPositionModel: any(named: 'currentPositionModel'),
          )).called(1);
    });
  });
}
