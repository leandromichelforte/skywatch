import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skywatch/core/endpoints/endpoints.dart';
import 'package:skywatch/core/errors/exceptions/exceptions.dart';
import 'package:skywatch/features/weather_info/data/datasources/datasources.dart';
import 'package:skywatch/features/weather_info/data/models/models.dart';
import '../../../../core/core_mocktail.dart';

void main() {
  group('GetWeatherDatasourceImpl', () {
    late GetWeatherDatasourceImpl datasource;
    late MockDio mockDio;
    const currentPositionModel = CurrentPositionModel(
      latitude: '42.0',
      longitude: '-73.0',
    );

    setUp(() {
      mockDio = MockDio();
      datasource = GetWeatherDatasourceImpl(dio: mockDio);
    });

    test('should get weather data successfully', () async {
      final mockResponse = Response<Map<String, dynamic>>(
        data: {
          "location": {
            "name": "London",
            "region": "City of London, Greater London",
            "country": "United Kingdom",
          },
          "current": {
            "temp_c": 9.0,
            "condition": {
              "text": "Clear",
              "icon": "//cdn.weatherapi.com/weather/64x64/night/113.png",
            },
            "wind_mph": 5.6,
            "humidity": 93,
          },
          "forecast": {
            "forecastday": [
              {
                "day": {
                  "maxtemp_c": 14.4,
                  "mintemp_c": 9.8,
                  "daily_chance_of_rain": 0,
                  "daily_chance_of_snow": 0,
                  "condition": {
                    "text": "Partly cloudy",
                    "icon": "//cdn.weatherapi.com/weather/64x64/day/116.png",
                    "code": 1003
                  },
                },
                "hour": [
                  {
                    "time": "2023-10-30 00:00",
                    "temp_c": 11.1,
                    "condition": {
                      "text": "Partly cloudy",
                      "icon":
                          "//cdn.weatherapi.com/weather/64x64/night/116.png",
                    },
                  },
                ]
              }
            ]
          }
        },
        statusCode: 200,
        requestOptions: RequestOptions(path: '/weather'),
      );

      when(() => mockDio.get(
            Endpoints.getWeatherAndForecast(
              latitude: currentPositionModel.latitude,
              longitude: currentPositionModel.longitude,
            ),
          )).thenAnswer((_) async => mockResponse);

      final result =
          await datasource(currentPositionModel: currentPositionModel);

      expect(result, isA<WeatherModel>());
    });

    test('should throw a ConnectionException on Dio error', () async {
      when(() => mockDio.get(
                any(),
              ))
          .thenThrow(DioException(
              error: const SocketException('message'),
              requestOptions: RequestOptions()));

      expect(
          () async =>
              await datasource(currentPositionModel: currentPositionModel),
          throwsA(isA<ConnectionException>()));
    });

    test('should throw a ApiException on Dio error', () async {
      when(() => mockDio.get(
                any(),
              ))
          .thenThrow(
              DioException(error: Object(), requestOptions: RequestOptions()));

      expect(
          () async =>
              await datasource(currentPositionModel: currentPositionModel),
          throwsA(isA<ApiException>()));
    });

    test('should throw a GenericException on Dio error', () async {
      when(() => mockDio.get(
            any(),
          )).thenThrow(Exception());

      expect(
          () async =>
              await datasource(currentPositionModel: currentPositionModel),
          throwsA(isA<GenericException>()));
    });
  });
}
