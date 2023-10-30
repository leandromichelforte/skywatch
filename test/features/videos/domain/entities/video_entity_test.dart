import 'package:flutter_test/flutter_test.dart';
import 'package:skywatch/features/videos/domain/entities/video_entity.dart';

void main() {
  test('should have correct properties, be equal and have the same hashCode',
      () {
    const urlMp4 = 'sample/video.mp4';
    const title = 'Sample Video';
    const description = 'A description of the sample video';

    const entity1 = VideoEntity(
      urlMp4: urlMp4,
      title: title,
      description: description,
    );
    const entity2 = VideoEntity(
      urlMp4: 'sample/video.mp4',
      title: 'Sample Video',
      description: 'A description of the sample video',
    );

    expect(entity1, entity2);
    expect(entity1.hashCode, entity2.hashCode);

    expect(entity1.urlMp4, urlMp4);
    expect(entity1.title, title);
    expect(entity1.description, description);
  });
}
