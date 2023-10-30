import 'package:skywatch/features/videos/domain/entities/entities.dart';

final class VideoModel extends VideoEntity {
  const VideoModel({
    required super.urlMp4,
    required super.title,
    required super.description,
  });

  factory VideoModel.fromMap({
    required Map<String, dynamic> map,
  }) =>
      VideoModel(
        urlMp4: map['assets']['mp4'],
        title: map['title'],
        description: map['description'],
      );
}
