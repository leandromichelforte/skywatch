import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skywatch/core/errors/failures/failures.dart';
import 'package:skywatch/features/videos/domain/repositories/repositories.dart';
import 'package:skywatch/features/videos/domain/usecases/usecases.dart';

class MockGetVideoFileRepository extends Mock
    implements GetVideoFileRepository {}

void main() {
  late GetVideoFileUsecase usecase;
  late GetVideoFileRepository mockRepository;

  setUp(() {
    mockRepository = MockGetVideoFileRepository();
    usecase = GetVideoFileUsecaseImpl(getVideoFileRepository: mockRepository);
  });

  test('should get a video file from the repository', () async {
    const imageSource = ImageSource.camera;
    final file = File('sample/video.mp4');
    when(() => mockRepository(imageSource: imageSource))
        .thenAnswer((_) async => Right(file));
    final result = await usecase(imageSource: imageSource);
    expect(result, equals(Right(file)));
    verify(() => mockRepository(imageSource: imageSource)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });

  test('should return a failure when an error occurs', () async {
    const imageSource = ImageSource.camera;
    const failure = SkyWatchFailure(message: 'An error occurred');
    when(() => mockRepository(imageSource: imageSource))
        .thenAnswer((_) async => const Left(failure));
    final result = await usecase(imageSource: imageSource);
    expect(result, equals(const Left(failure)));
    verify(() => mockRepository(imageSource: imageSource)).called(1);
    verifyNoMoreInteractions(mockRepository);
  });
}
