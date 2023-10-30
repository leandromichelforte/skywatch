base class CurrentPositionEntity {
  const CurrentPositionEntity({
    required this.latitude,
    required this.longitude,
  });
  final String latitude;
  final String longitude;

  @override
  bool operator ==(Object other) {
    return other is CurrentPositionEntity &&
        other.latitude == latitude &&
        other.longitude == longitude;
  }

  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode;
}
