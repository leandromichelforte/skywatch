import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skywatch/core/errors/failures/failures.dart';
import 'package:skywatch/features/videos/domain/repositories/repositories.dart';
import 'package:skywatch/features/videos/domain/usecases/usecases.dart';

final class GetVideoFileUsecaseImpl implements GetVideoFileUsecase {
  const GetVideoFileUsecaseImpl({
    required GetVideoFileRepository getVideoFileRepository,
  }) : _getVideoFileRepository = getVideoFileRepository;
  final GetVideoFileRepository _getVideoFileRepository;
  @override
  Future<Either<Failure, File?>> call({
    required ImageSource imageSource,
  }) =>
      _getVideoFileRepository(
        imageSource: imageSource,
      );
}
