import 'package:dartz/dartz.dart';
import 'package:skywatch/core/errors/exceptions/exceptions.dart';
import 'package:skywatch/core/errors/failures/failures.dart';
import 'package:skywatch/features/videos/data/datasources/datasources.dart';
import 'package:skywatch/features/videos/data/models/models.dart';
import 'package:skywatch/features/videos/domain/repositories/repositories.dart';

final class GetVideosRepositoryImpl implements GetVideosRepository {
  const GetVideosRepositoryImpl(
      {required VideosDatasource uploadVideoDatasource})
      : _uploadVideoDatasource = uploadVideoDatasource;

  final VideosDatasource _uploadVideoDatasource;
  @override
  Future<Either<Failure, List<VideoModel>>> call() async {
    try {
      final videoModelList = await _uploadVideoDatasource.getVideos();
      return Right(videoModelList);
    } on ApiException catch (exception) {
      return Left(SkyWatchFailure(message: exception.message));
    } on ConnectionException catch (exception) {
      return Left(SkyWatchFailure(message: exception.message));
    } on GenericException catch (exception) {
      return Left(SkyWatchFailure(message: exception.message));
    }
  }
}
