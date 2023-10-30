import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skywatch/core/errors/exceptions/exceptions.dart';
import 'package:skywatch/core/errors/failures/failures.dart';
import 'package:skywatch/features/weather_info/data/datasources/datasources.dart';
import 'package:skywatch/features/weather_info/data/models/models.dart';
import 'package:skywatch/features/weather_info/data/repositories/get_current_position_repository_impl.dart';

class MockGetCurrentPositionDatasource extends Mock
    implements GetCurrentPositionDatasource {}

void main() {
  late GetCurrentPositionRepositoryImpl repository;
  late MockGetCurrentPositionDatasource mockDatasource;

  setUp(() {
    mockDatasource = MockGetCurrentPositionDatasource();
    repository = GetCurrentPositionRepositoryImpl(
        getCurrentPositionDatasource: mockDatasource);
  });

  group('GetCurrentPositionRepository', () {
    const currentPositionModel = CurrentPositionModel(
      latitude: '12.345',
      longitude: '67.890',
    );

    test('should return CurrentPositionModel from datasource', () async {
      when(() => mockDatasource())
          .thenAnswer((_) async => currentPositionModel);
      final result = await repository();
      expect(result, const Right(currentPositionModel));
      verify(() => mockDatasource.call()).called(1);
    });

    test(
        'should return PermissionNotGrantedFailure on PermissionDeniedException',
        () async {
      when(() => mockDatasource())
          .thenThrow(const PermissionDeniedException('Permission denied'));
      final result = await repository();
      expect(
          result,
          const Left(
              PermissionNotGrantedFailure(message: 'Permission denied')));
      verify(() => mockDatasource()).called(1);
    });

    test('should return SkyWatchFailure on GenericException', () async {
      when(() => mockDatasource.call()).thenThrow(
          const GenericException(message: 'Some error', error: Object()));
      final result = await repository();
      expect(result, const Left(SkyWatchFailure(message: 'Some error')));
      verify(() => mockDatasource.call()).called(1);
    });
  });
}
