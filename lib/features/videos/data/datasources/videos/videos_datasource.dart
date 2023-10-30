import 'package:skywatch/features/videos/data/models/models.dart';

abstract interface class VideosDatasource {
  Future<void> uploadVideo({
    required UploadVideoParamsModel uploadVideoParamsModel,
  });

  Future<List<VideoModel>> getVideos();
}
