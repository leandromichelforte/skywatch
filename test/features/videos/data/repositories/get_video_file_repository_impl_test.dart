import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:skywatch/core/errors/exceptions/exceptions.dart';
import 'package:skywatch/core/errors/failures/failures.dart';
import 'package:skywatch/features/videos/data/datasources/datasources.dart';
import 'package:skywatch/features/videos/data/repositories/repositories.dart';
import 'package:mocktail/mocktail.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class MockGetVideoFileDatasource extends Mock
    implements GetVideoFileDatasource {}

void main() {
  late GetVideoFileRepositoryImpl repository;
  late GetVideoFileDatasource datasource;

  setUp(() {
    datasource = MockGetVideoFileDatasource();
    repository = GetVideoFileRepositoryImpl(getVideoFileDatasource: datasource);
  });

  group('GetVideoFileRepository', () {
    const imageSource = ImageSource.camera;

    test('should return a File when the datasource call is successful',
        () async {
      final mockFile = File('mock_video.mp4');

      when(() => datasource(imageSource: imageSource))
          .thenAnswer((_) async => mockFile);

      final result = await repository.call(imageSource: imageSource);

      expect(result, Right(mockFile));
      verify(() => datasource(imageSource: imageSource)).called(1);
    });

    test('should return a SkyWatchFailure when an exception is thrown',
        () async {
      const exception = GenericException(
          message: 'An error occurred. Try again.', error: Object());

      when(() => datasource(imageSource: imageSource)).thenThrow(exception);

      final result = await repository(imageSource: imageSource);

      expect(result, Left(SkyWatchFailure(message: exception.message)));
      verify(() => datasource(imageSource: imageSource)).called(1);
    });
  });
}
