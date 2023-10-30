import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:skywatch/core/errors/exceptions/exceptions.dart';
import 'package:skywatch/core/errors/failures/failures.dart';
import 'package:skywatch/features/weather_info/data/datasources/datasources.dart';
import 'package:skywatch/features/weather_info/domain/entities/entities.dart';
import 'package:skywatch/features/weather_info/domain/repositories/repositories.dart';

final class GetCurrentPositionRepositoryImpl
    implements GetCurrentPositionRepository {
  const GetCurrentPositionRepositoryImpl(
      {required GetCurrentPositionDatasource getCurrentPositionDatasource})
      : _getCurrentPositionDatasource = getCurrentPositionDatasource;

  final GetCurrentPositionDatasource _getCurrentPositionDatasource;
  @override
  Future<Either<Failure, CurrentPositionEntity>> call() async {
    try {
      final result = await _getCurrentPositionDatasource();
      return Right(result);
    } on PermissionDeniedException catch (exception) {
      return Left(PermissionNotGrantedFailure(message: exception.message!));
    } on GenericException catch (exception) {
      return Left(SkyWatchFailure(message: exception.message));
    }
  }
}
