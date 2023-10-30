import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skywatch/core/errors/failures/failures.dart';

abstract interface class GetVideoFileUsecase {
  Future<Either<Failure, File?>> call({
    required ImageSource imageSource,
  });
}
