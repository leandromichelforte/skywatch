import 'package:flutter_test/flutter_test.dart';
import 'package:skywatch/core/constants/strings/strings.dart';
import 'package:skywatch/features/videos/domain/entities/upload_video_params_entity.dart';

void main() {
  test('should have correct properties, be equal and have the same hashCode',
      () {
    const filePath = 'sample/video.mp4';
    const videoTitle = 'Sample Video';
    const videoDescription = 'A description of the sample video';

    const entity1 = UploadVideoParamsEntity(
      filePath: filePath,
      videoTitle: videoTitle,
      videoDescription: videoDescription,
    );
    const entity2 = UploadVideoParamsEntity(
      filePath: 'sample/video.mp4',
      videoTitle: 'Sample Video',
      videoDescription: 'A description of the sample video',
    );

    expect(entity1, entity2);
    expect(entity1.hashCode, entity2.hashCode);

    expect(entity1.filePath, filePath);
    expect(entity1.videoTitle, videoTitle);
    expect(entity1.videoDescription, videoDescription);
    expect(entity1.apiKey, VideosStringsConstants.apiKey);
  });
}
