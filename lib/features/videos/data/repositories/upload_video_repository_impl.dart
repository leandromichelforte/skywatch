import 'package:dartz/dartz.dart';
import 'package:skywatch/core/errors/exceptions/exceptions.dart';
import 'package:skywatch/core/errors/failures/failures.dart';
import 'package:skywatch/features/videos/data/datasources/datasources.dart';
import 'package:skywatch/features/videos/data/models/models.dart';
import 'package:skywatch/features/videos/domain/entities/entities.dart';
import 'package:skywatch/features/videos/domain/repositories/repositories.dart';

final class UploadVideoRepositoryImpl implements UploadVideoRepository {
  const UploadVideoRepositoryImpl({
    required VideosDatasource videosDatasource,
  }) : _videosDatasource = videosDatasource;

  final VideosDatasource _videosDatasource;
  @override
  Future<Either<Failure, void>> call({
    required UploadVideoParamsEntity uploadVideoParamsEntity,
  }) async {
    try {
      await _videosDatasource.uploadVideo(
        uploadVideoParamsModel: UploadVideoParamsModel.fromEntity(
          uploadVideoParamsEntity: uploadVideoParamsEntity,
        ),
      );
      return const Right(null);
    } on ApiException catch (exception) {
      return Left(SkyWatchFailure(message: exception.message));
    } on ConnectionException catch (exception) {
      return Left(SkyWatchFailure(message: exception.message));
    } on GenericException catch (exception) {
      return Left(SkyWatchFailure(message: exception.message));
    }
  }
}
