import 'package:flutter_test/flutter_test.dart';
import 'package:skywatch/core/get_it_instance/get_it_instance.dart';
import 'package:skywatch/core/inject/current_position_inject.dart';
import 'package:skywatch/features/weather_info/data/datasources/datasources.dart';
import 'package:skywatch/features/weather_info/domain/repositories/repositories.dart';
import 'package:skywatch/features/weather_info/domain/usecases/usecases.dart';

void main() {
  setUp(() {
    CurrentPositionInject.inject(getIt);
  });

  tearDown(() {
    getIt.reset();
  });

  test('should register GetCurrentPositionDatasource', () {
    final dataSource = getIt<GetCurrentPositionDatasource>();
    expect(dataSource, isA<GetCurrentPositionDatasource>());
  });

  test('should register GetCurrentPositionRepository', () {
    final repository = getIt<GetCurrentPositionRepository>();
    expect(repository, isA<GetCurrentPositionRepository>());
  });

  test('should register GetCurrentPositionUsecase', () {
    final usecase = getIt<GetCurrentPositionUsecase>();
    expect(usecase, isA<GetCurrentPositionUsecase>());
  });
}
