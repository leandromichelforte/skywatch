import 'package:dartz/dartz.dart';
import 'package:skywatch/core/errors/failures/failures.dart';
import 'package:skywatch/features/videos/domain/entities/entities.dart';
import 'package:skywatch/features/videos/domain/repositories/repositories.dart';
import 'package:skywatch/features/videos/domain/usecases/usecases.dart';

final class GetVideosUsecaseImpl implements GetVideosUsecase {
  const GetVideosUsecaseImpl({
    required GetVideosRepository getVideosRepository,
  }) : _getVideosRepository = getVideosRepository;
  final GetVideosRepository _getVideosRepository;
  @override
  Future<Either<Failure, List<VideoEntity>>> call() => _getVideosRepository();
}
