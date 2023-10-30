import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skywatch/core/errors/failures/failures.dart';
import 'package:skywatch/features/videos/domain/entities/entities.dart';
import 'package:skywatch/features/videos/domain/repositories/repositories.dart';
import 'package:skywatch/features/videos/domain/usecases/usecases.dart';

class MockGetVideosRepository extends Mock implements GetVideosRepository {}

void main() {
  late GetVideosUsecase usecase;
  late GetVideosRepository mockRepository;

  setUp(() {
    mockRepository = MockGetVideosRepository();
    usecase = GetVideosUsecaseImpl(getVideosRepository: mockRepository);
  });

  test('should get a list of video entities from the repository', () async {
    const videoEntities = <VideoEntity>[
      VideoEntity(
          urlMp4: 'url1', title: 'Title 1', description: 'Description 1'),
      VideoEntity(
          urlMp4: 'url2', title: 'Title 2', description: 'Description 2'),
    ];
    when(() => mockRepository())
        .thenAnswer((_) async => const Right(videoEntities));
    final result = await usecase();
    expect(result, equals(const Right(videoEntities)));
    verify(() => mockRepository()).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return a failure when an error occurs', () async {
    const failure = SkyWatchFailure(message: 'An error occurred');
    when(() => mockRepository()).thenAnswer((_) async => const Left(failure));
    final result = await usecase();
    expect(result, equals(const Left(failure)));
    verify(() => mockRepository()).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
