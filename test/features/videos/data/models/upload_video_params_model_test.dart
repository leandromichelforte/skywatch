import 'package:flutter_test/flutter_test.dart';
import 'package:skywatch/features/videos/domain/entities/entities.dart';
import 'package:skywatch/features/videos/data/models/models.dart';

void main() {
  group('UploadVideoParamsModel', () {
    test('apiKeyToMap should return a map with apiKey', () {
      const params = UploadVideoParamsModel(
        filePath: 'video.mp4',
        videoTitle: 'Video Title',
        videoDescription: 'Video Description',
      );

      final apiKeyMap = params.apiKeyToMap();

      expect(apiKeyMap, {'apiKey': params.apiKey});
    });

    test(
        'titleAndDescriptionToMap should return a map with title and description',
        () {
      const params = UploadVideoParamsModel(
        filePath: 'video.mp4',
        videoTitle: 'Video Title',
        videoDescription: 'Video Description',
      );

      final titleAndDescriptionMap = params.titleAndDescriptionToMap();

      expect(titleAndDescriptionMap, {
        'title': params.videoTitle,
        'description': params.videoDescription,
      });
    });

    test('filePathToMap should return a map with filePath', () {
      const params = UploadVideoParamsModel(
        filePath: 'video.mp4',
        videoTitle: 'Video Title',
        videoDescription: 'Video Description',
      );

      final filePathMap = params.filePathToMap();

      expect(filePathMap, {'file': params.filePath});
    });

    test('fromEntity should create an UploadVideoParamsModel from an entity',
        () {
      const entity = UploadVideoParamsEntity(
        filePath: 'video.mp4',
        videoTitle: 'Video Title',
        videoDescription: 'Video Description',
      );

      final model =
          UploadVideoParamsModel.fromEntity(uploadVideoParamsEntity: entity);

      expect(model.filePath, entity.filePath);
      expect(model.videoTitle, entity.videoTitle);
      expect(model.videoDescription, entity.videoDescription);
    });
  });
}
