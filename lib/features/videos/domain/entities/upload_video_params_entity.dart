import 'package:skywatch/core/constants/strings/strings.dart';

base class UploadVideoParamsEntity {
  const UploadVideoParamsEntity({
    required this.filePath,
    required this.videoTitle,
    required this.videoDescription,
  });
  final String apiKey = VideosStringsConstants.apiKey;
  final String filePath;
  final String videoTitle;
  final String videoDescription;

  @override
  bool operator ==(Object other) {
    return other is UploadVideoParamsEntity &&
        other.filePath == filePath &&
        other.videoTitle == videoTitle &&
        other.videoDescription == videoDescription;
  }

  @override
  int get hashCode =>
      filePath.hashCode ^ videoTitle.hashCode ^ videoDescription.hashCode;
}
