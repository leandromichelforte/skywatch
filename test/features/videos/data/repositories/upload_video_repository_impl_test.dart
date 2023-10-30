import 'package:flutter_test/flutter_test.dart';
import 'package:skywatch/core/errors/exceptions/exceptions.dart';
import 'package:skywatch/core/errors/failures/failures.dart';
import 'package:skywatch/features/videos/data/datasources/datasources.dart';
import 'package:skywatch/features/videos/data/models/upload_video_params_model.dart';
import 'package:skywatch/features/videos/data/repositories/upload_video_repository_impl.dart';
import 'package:skywatch/features/videos/domain/entities/entities.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';

class MockVideosDatasource extends Mock implements VideosDatasource {}

void main() {
  late UploadVideoRepositoryImpl repository;
  late VideosDatasource datasource;

  setUp(() {
    datasource = MockVideosDatasource();
    repository = UploadVideoRepositoryImpl(videosDatasource: datasource);
    registerFallbackValue(
      const UploadVideoParamsModel(
        filePath: 'filePath',
        videoTitle: 'videoTitle',
        videoDescription: 'videoDescription',
      ),
    );
  });

  group('UploadVideoRepository', () {
    test('should return void when the datasource call is successful', () async {
      const uploadVideoParamsEntity = UploadVideoParamsEntity(
          filePath: 'filePath',
          videoTitle: 'videoTitle',
          videoDescription: 'videoDescription');

      when(() => datasource.uploadVideo(
              uploadVideoParamsModel: any(named: 'uploadVideoParamsModel')))
          .thenAnswer((_) async {});

      final result =
          await repository(uploadVideoParamsEntity: uploadVideoParamsEntity);

      expect(result, const Right(null));
      verify(() => datasource.uploadVideo(
              uploadVideoParamsModel: any(named: 'uploadVideoParamsModel')))
          .called(1);
    });

    test('should return a SkyWatchFailure when a GenericException is thrown',
        () async {
      const exception = GenericException(
          message: 'A generic exception occurred.', error: 'error');

      when(() => datasource.uploadVideo(
              uploadVideoParamsModel: any(named: 'uploadVideoParamsModel')))
          .thenThrow(exception);

      const uploadVideoParamsEntity = UploadVideoParamsEntity(
          filePath: 'filePath',
          videoTitle: 'videoTitle',
          videoDescription: 'videoDescription');

      final result =
          await repository(uploadVideoParamsEntity: uploadVideoParamsEntity);

      expect(result, Left(SkyWatchFailure(message: exception.message)));
      verify(() => datasource.uploadVideo(
              uploadVideoParamsModel: any(named: 'uploadVideoParamsModel')))
          .called(1);
    });
  });
}
