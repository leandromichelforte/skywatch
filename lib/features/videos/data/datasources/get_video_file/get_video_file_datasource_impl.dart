import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:skywatch/core/constants/strings/strings.dart';
import 'package:skywatch/core/errors/exceptions/exceptions.dart';
import 'package:skywatch/features/videos/data/datasources/datasources.dart';

final class GetVideoFileDatasourceImpl implements GetVideoFileDatasource {
  const GetVideoFileDatasourceImpl({required ImagePicker imagePicker})
      : _imagePicker = imagePicker;
  final ImagePicker _imagePicker;
  @override
  Future<File?> call({required ImageSource imageSource}) async {
    try {
      final videoFile = await _imagePicker.pickVideo(
        source: imageSource,
      );
      if (videoFile != null) {
        return File(videoFile.path);
      }
      return null;
    } catch (exception) {
      throw GenericException(
        message: SharedStringsConstants.occurredAnErrorTryAgain,
        error: exception,
      );
    }
  }
}
