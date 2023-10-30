import 'package:flutter_test/flutter_test.dart';
import 'package:skywatch/features/videos/data/models/models.dart';

void main() {
  group('VideoModel', () {
    test('fromMap should create a VideoModel from a map', () {
      final map = <String, dynamic>{
        'assets': {
          'mp4': 'video.mp4',
        },
        'title': 'Video Title',
        'description': 'Video Description',
      };

      final model = VideoModel.fromMap(map: map);

      expect(model.urlMp4, map['assets']['mp4']);
      expect(model.title, map['title']);
      expect(model.description, map['description']);
    });
  });
}
