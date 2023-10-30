import 'package:skywatch/features/videos/domain/entities/entities.dart';

final class UploadVideoParamsModel extends UploadVideoParamsEntity {
  const UploadVideoParamsModel({
    required super.filePath,
    required super.videoTitle,
    required super.videoDescription,
  });

  Map<String, String> apiKeyToMap() => {
        'apiKey': apiKey,
      };

  Map<String, String> titleAndDescriptionToMap() => {
        'title': videoTitle,
        'description': videoDescription,
      };

  Map<String, String> filePathToMap() => {
        'file': filePath,
      };

  factory UploadVideoParamsModel.fromEntity({
    required UploadVideoParamsEntity uploadVideoParamsEntity,
  }) =>
      UploadVideoParamsModel(
        filePath: uploadVideoParamsEntity.filePath,
        videoTitle: uploadVideoParamsEntity.videoTitle,
        videoDescription: uploadVideoParamsEntity.videoDescription,
      );
}
