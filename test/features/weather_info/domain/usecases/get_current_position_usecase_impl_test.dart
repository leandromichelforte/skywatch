import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skywatch/core/errors/failures/failures.dart';
import 'package:skywatch/features/weather_info/domain/entities/entities.dart';
import 'package:skywatch/features/weather_info/domain/repositories/repositories.dart';
import 'package:skywatch/features/weather_info/domain/usecases/usecases.dart';

class MockGetCurrentPositionRepository extends Mock
    implements GetCurrentPositionRepository {}

void main() {
  late GetCurrentPositionUsecase usecase;
  late GetCurrentPositionRepository repository;

  setUp(() {
    repository = MockGetCurrentPositionRepository();
    usecase = GetCurrentPositionUsecaseImpl(
      getCurrentPositionRepository: repository,
    );
  });

  test('should call the repository to get the current position', () async {
    const currentPosition = CurrentPositionEntity(
      latitude: '10.1234',
      longitude: '20.5678',
    );

    when(() => repository())
        .thenAnswer((_) async => const Right(currentPosition));

    final result = await usecase();

    expect(result, const Right(currentPosition));
    verify(() => repository()).called(1);
  });

  test('should return a failure when an error occurs', () async {
    const failure = SkyWatchFailure(message: 'An error occurred');
    when(() => repository()).thenAnswer((_) async => const Left(failure));

    final result = await usecase();

    expect(result, const Left(failure));
    verify(() => repository()).called(1);
  });
}
