import 'package:dartz/dartz.dart';
import 'package:skywatch/core/errors/failures/failures.dart';
import 'package:skywatch/features/weather_info/domain/entities/entities.dart';
import 'package:skywatch/features/weather_info/domain/repositories/repositories.dart';
import 'package:skywatch/features/weather_info/domain/usecases/usecases.dart';

final class GetWeatherUsecaseImpl implements GetWeatherUsecase {
  const GetWeatherUsecaseImpl(
      {required GetWeatherRepository getWeatherRepository})
      : _getWeatherRepository = getWeatherRepository;
  final GetWeatherRepository _getWeatherRepository;
  @override
  Future<Either<Failure, WeatherEntity>> call({
    required CurrentPositionEntity currentPositionEntity,
  }) =>
      _getWeatherRepository(currentPositionEntity: currentPositionEntity);
}
