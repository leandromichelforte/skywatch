import 'dart:io';

import 'package:skywatch/core/constants/strings/strings.dart';
import 'package:skywatch/core/endpoints/endpoints.dart';
import 'package:skywatch/core/errors/exceptions/exceptions.dart';
import 'package:skywatch/features/weather_info/data/datasources/datasources.dart';
import 'package:dio/dio.dart';
import 'package:skywatch/features/weather_info/data/models/models.dart';

final class GetWeatherDatasourceImpl implements GetWeatherDatasource {
  const GetWeatherDatasourceImpl({required Dio dio}) : _dio = dio;
  final Dio _dio;
  @override
  Future<WeatherModel> call(
      {required CurrentPositionModel currentPositionModel}) async {
    try {
      final response = await _dio.get(
        Endpoints.getWeatherAndForecast(
          latitude: currentPositionModel.latitude,
          longitude: currentPositionModel.longitude,
        ),
      );
      return WeatherModel.fromMap(map: response.data);
    } on DioException catch (exception) {
      if (exception.error is SocketException) {
        throw ConnectionException(error: exception);
      }
      throw ApiException(
        error: exception,
      );
    } catch (exception) {
      throw GenericException(
        message: SharedStringsConstants.occurredAnErrorTryAgain,
        error: exception,
      );
    }
  }
}
