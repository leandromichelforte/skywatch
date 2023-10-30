import 'package:dartz/dartz.dart';
import 'package:skywatch/core/errors/exceptions/exceptions.dart';
import 'package:skywatch/core/errors/failures/failures.dart';
import 'package:skywatch/features/weather_info/data/datasources/datasources.dart';
import 'package:skywatch/features/weather_info/data/models/models.dart';
import 'package:skywatch/features/weather_info/domain/entities/entities.dart';
import 'package:skywatch/features/weather_info/domain/repositories/repositories.dart';

final class GetWeatherRepositoryImpl implements GetWeatherRepository {
  const GetWeatherRepositoryImpl(
      {required GetWeatherDatasource getWeatherDatasource})
      : _getWeatherDatasource = getWeatherDatasource;

  final GetWeatherDatasource _getWeatherDatasource;
  @override
  Future<Either<Failure, WeatherEntity>> call(
      {required CurrentPositionEntity currentPositionEntity}) async {
    try {
      final result = await _getWeatherDatasource(
        currentPositionModel: CurrentPositionModel.fromCurrentPositionEntity(
          currentPositionEntity: currentPositionEntity,
        ),
      );
      return Right(result);
    } on ApiException catch (exception) {
      return Left(SkyWatchFailure(message: exception.message));
    } on ConnectionException catch (exception) {
      return Left(SkyWatchFailure(message: exception.message));
    } on GenericException catch (exception) {
      return Left(SkyWatchFailure(message: exception.message));
    }
  }
}
