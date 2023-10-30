base class VideoEntity {
  const VideoEntity({
    required this.urlMp4,
    required this.title,
    required this.description,
  });

  final String urlMp4;
  final String title;
  final String description;

  @override
  bool operator ==(Object other) {
    return other is VideoEntity &&
        other.urlMp4 == urlMp4 &&
        other.title == title &&
        other.description == description;
  }

  @override
  int get hashCode => urlMp4.hashCode ^ title.hashCode ^ description.hashCode;
}
