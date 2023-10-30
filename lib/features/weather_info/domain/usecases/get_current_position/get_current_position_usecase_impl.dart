import 'package:dartz/dartz.dart';
import 'package:skywatch/core/errors/failures/failures.dart';
import 'package:skywatch/features/weather_info/domain/entities/entities.dart';
import 'package:skywatch/features/weather_info/domain/repositories/repositories.dart';
import 'package:skywatch/features/weather_info/domain/usecases/usecases.dart';

final class GetCurrentPositionUsecaseImpl implements GetCurrentPositionUsecase {
  const GetCurrentPositionUsecaseImpl(
      {required GetCurrentPositionRepository getCurrentPositionRepository})
      : _getCurrentPositionRepository = getCurrentPositionRepository;
  final GetCurrentPositionRepository _getCurrentPositionRepository;
  @override
  Future<Either<Failure, CurrentPositionEntity>> call() =>
      _getCurrentPositionRepository();
}
