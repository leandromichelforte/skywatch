import 'package:flutter_test/flutter_test.dart';
import 'package:skywatch/core/errors/exceptions/exceptions.dart';
import 'package:skywatch/core/errors/failures/failures.dart';
import 'package:skywatch/features/videos/data/datasources/datasources.dart';
import 'package:skywatch/features/videos/data/models/models.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skywatch/features/videos/data/repositories/get_videos_repository_impl.dart';

class MockVideosDatasource extends Mock implements VideosDatasource {}

void main() {
  late GetVideosRepositoryImpl repository;
  late VideosDatasource datasource;

  setUp(() {
    datasource = MockVideosDatasource();
    repository = GetVideosRepositoryImpl(uploadVideoDatasource: datasource);
  });

  group('GetVideosRepository', () {
    test(
        'should return a list of VideoModel when the datasource call is successful',
        () async {
      const videoModels = [
        VideoModel(
            urlMp4: 'video.mp4', title: 'title', description: 'description')
      ];

      when(() => datasource.getVideos()).thenAnswer((_) async => videoModels);

      final result = await repository.call();

      expect(result, const Right(videoModels));
      verify(() => datasource.getVideos()).called(1);
    });

    test('should return a SkyWatchFailure when an ApiException is thrown',
        () async {
      const exception = ApiException(error: Object());

      when(() => datasource.getVideos()).thenThrow(exception);

      final result = await repository.call();

      expect(result, Left(SkyWatchFailure(message: exception.message)));
      verify(() => datasource.getVideos()).called(1);
    });

    test('should return a SkyWatchFailure when a ConnectionException is thrown',
        () async {
      const exception =
          ConnectionException(error: 'A connection exception occurred.');

      when(() => datasource.getVideos()).thenThrow(exception);

      final result = await repository.call();

      expect(result, Left(SkyWatchFailure(message: exception.message)));
      verify(() => datasource.getVideos()).called(1);
    });

    test('should return a SkyWatchFailure when a GenericException is thrown',
        () async {
      const exception =
          GenericException(message: 'An error occurred', error: 'Some error');

      when(() => datasource.getVideos()).thenThrow(exception);

      final result = await repository.call();

      expect(result, Left(SkyWatchFailure(message: exception.message)));
      verify(() => datasource.getVideos()).called(1);
    });
  });
}
