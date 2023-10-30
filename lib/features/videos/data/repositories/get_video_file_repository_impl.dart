import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skywatch/core/errors/exceptions/exceptions.dart';
import 'package:skywatch/core/errors/failures/failures.dart';
import 'package:skywatch/features/videos/data/datasources/datasources.dart';
import 'package:skywatch/features/videos/domain/repositories/repositories.dart';

final class GetVideoFileRepositoryImpl implements GetVideoFileRepository {
  const GetVideoFileRepositoryImpl(
      {required GetVideoFileDatasource getVideoFileDatasource})
      : _getVideoFileDatasource = getVideoFileDatasource;

  final GetVideoFileDatasource _getVideoFileDatasource;
  @override
  Future<Either<Failure, File?>> call(
      {required ImageSource imageSource}) async {
    try {
      final result = await _getVideoFileDatasource(
        imageSource: imageSource,
      );
      return Right(result);
    } on GenericException catch (exception) {
      return Left(SkyWatchFailure(message: exception.message));
    }
  }
}
