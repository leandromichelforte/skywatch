import 'dart:io';
import 'package:image_picker/image_picker.dart';

abstract interface class GetVideoFileDatasource {
  Future<File?> call({
    required ImageSource imageSource,
  });
}
