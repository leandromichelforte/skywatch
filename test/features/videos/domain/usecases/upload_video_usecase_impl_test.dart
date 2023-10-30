import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skywatch/core/errors/failures/failures.dart';
import 'package:skywatch/features/videos/domain/entities/entities.dart';
import 'package:skywatch/features/videos/domain/repositories/repositories.dart';
import 'package:skywatch/features/videos/domain/usecases/usecases.dart';

class MockUploadVideoRepository extends Mock implements UploadVideoRepository {}

void main() {
  late UploadVideoUsecase usecase;
  late UploadVideoRepository mockRepository;

  setUp(() {
    mockRepository = MockUploadVideoRepository();
    usecase = UploadVideoUsecaseImpl(uploadVideoRepository: mockRepository);
  });

  test('should upload a video using the repository', () async {
    const uploadParams = UploadVideoParamsEntity(
      filePath: 'sample/video.mp4',
      videoTitle: 'Sample Video',
      videoDescription: 'A description of the sample video',
    );
    when(() => mockRepository(uploadVideoParamsEntity: uploadParams))
        .thenAnswer((_) async => const Right(null));
    final result = await usecase(uploadVideoParamsEntity: uploadParams);
    expect(result, equals(const Right(null)));
    verify(() => mockRepository(uploadVideoParamsEntity: uploadParams))
        .called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return a failure when an error occurs', () async {
    const failure = SkyWatchFailure(message: 'An error occurred');
    const uploadParams = UploadVideoParamsEntity(
      filePath: 'sample/video.mp4',
      videoTitle: 'Sample Video',
      videoDescription: 'A description of the sample video',
    );
    when(() => mockRepository(uploadVideoParamsEntity: uploadParams))
        .thenAnswer((_) async => const Left(failure));
    final result = await usecase(uploadVideoParamsEntity: uploadParams);
    expect(result, equals(const Left(failure)));
    verify(() => mockRepository(uploadVideoParamsEntity: uploadParams))
        .called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
