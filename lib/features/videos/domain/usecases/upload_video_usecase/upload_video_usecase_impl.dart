import 'package:dartz/dartz.dart';
import 'package:skywatch/core/errors/failures/failures.dart';
import 'package:skywatch/features/videos/domain/entities/entities.dart';
import 'package:skywatch/features/videos/domain/repositories/repositories.dart';
import 'package:skywatch/features/videos/domain/usecases/usecases.dart';

final class UploadVideoUsecaseImpl implements UploadVideoUsecase {
  const UploadVideoUsecaseImpl({
    required UploadVideoRepository uploadVideoRepository,
  }) : _uploadVideoRepository = uploadVideoRepository;
  final UploadVideoRepository _uploadVideoRepository;
  @override
  Future<Either<Failure, void>> call({
    required UploadVideoParamsEntity uploadVideoParamsEntity,
  }) =>
      _uploadVideoRepository(
        uploadVideoParamsEntity: uploadVideoParamsEntity,
      );
}
