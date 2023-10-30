import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:skywatch/features/weather_info/data/models/current_position_model.dart';
import 'package:skywatch/features/weather_info/domain/entities/entities.dart';

void main() {
  group('CurrentPositionModel', () {
    test('should create a CurrentPositionModel instance', () {
      const currentPositionModel = CurrentPositionModel(
        latitude: '42.0',
        longitude: '-73.0',
      );

      expect(currentPositionModel, isA<CurrentPositionEntity>());
      expect(currentPositionModel.latitude, '42.0');
      expect(currentPositionModel.longitude, '-73.0');
    });

    test('should create a CurrentPositionModel from GeolocatorPosition', () {
      final geolocatorPosition = Position(
          latitude: 42.0,
          longitude: -73.0,
          timestamp: DateTime.now(),
          speed: 0,
          speedAccuracy: 0,
          heading: 0,
          accuracy: 0,
          altitude: 0,
          altitudeAccuracy: 0,
          headingAccuracy: 0);

      final currentPositionModel = CurrentPositionModel.fromGeolocatorPosition(
          geolocatorPosition: geolocatorPosition);

      expect(currentPositionModel, isA<CurrentPositionEntity>());
      expect(currentPositionModel.latitude, '42.0');
      expect(currentPositionModel.longitude, '-73.0');
    });

    test('should create a CurrentPositionModel from CurrentPositionEntity', () {
      const currentPositionEntity = CurrentPositionEntity(
        latitude: '42.0',
        longitude: '-73.0',
      );

      final currentPositionModel =
          CurrentPositionModel.fromCurrentPositionEntity(
              currentPositionEntity: currentPositionEntity);

      expect(currentPositionModel, isA<CurrentPositionEntity>());
      expect(currentPositionModel.latitude, '42.0');
      expect(currentPositionModel.longitude, '-73.0');
    });
  });
}
