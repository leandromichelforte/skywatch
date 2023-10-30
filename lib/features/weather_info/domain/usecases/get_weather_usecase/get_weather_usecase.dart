import 'package:dartz/dartz.dart';
import 'package:skywatch/core/errors/failures/failures.dart';
import 'package:skywatch/features/weather_info/domain/entities/entities.dart';

abstract interface class GetWeatherUsecase {
  Future<Either<Failure, WeatherEntity>> call({
    required CurrentPositionEntity currentPositionEntity,
  });
}
