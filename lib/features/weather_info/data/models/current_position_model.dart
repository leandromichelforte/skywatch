import 'package:geolocator/geolocator.dart';
import 'package:skywatch/features/weather_info/domain/entities/entities.dart';

final class CurrentPositionModel extends CurrentPositionEntity {
  const CurrentPositionModel(
      {required super.latitude, required super.longitude});

  factory CurrentPositionModel.fromGeolocatorPosition(
          {required Position geolocatorPosition}) =>
      CurrentPositionModel(
        latitude: geolocatorPosition.latitude.toString(),
        longitude: geolocatorPosition.longitude.toString(),
      );

  factory CurrentPositionModel.fromCurrentPositionEntity(
          {required CurrentPositionEntity currentPositionEntity}) =>
      CurrentPositionModel(
        latitude: currentPositionEntity.latitude,
        longitude: currentPositionEntity.longitude,
      );
}
