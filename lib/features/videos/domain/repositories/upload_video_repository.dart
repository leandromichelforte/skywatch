import 'package:dartz/dartz.dart';
import 'package:skywatch/core/errors/failures/failures.dart';
import 'package:skywatch/features/videos/domain/entities/entities.dart';

abstract interface class UploadVideoRepository {
  Future<Either<Failure, void>> call({
    required UploadVideoParamsEntity uploadVideoParamsEntity,
  });
}
