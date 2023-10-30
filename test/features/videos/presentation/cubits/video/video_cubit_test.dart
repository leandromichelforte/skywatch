import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skywatch/core/errors/failures/sky_watch_failure.dart';
import 'package:skywatch/features/videos/domain/entities/entities.dart';
import 'package:skywatch/features/videos/domain/usecases/usecases.dart';
import 'package:skywatch/features/videos/presentation/cubits/cubits.dart';

class MockGetVideoFileUsecase extends Mock implements GetVideoFileUsecase {}

class MockUploadVideoUsecase extends Mock implements UploadVideoUsecase {}

class MockGetVideosUsecase extends Mock implements GetVideosUsecase {}

void main() {
  late VideoCubit videoCubit;
  late MockGetVideoFileUsecase mockGetVideoFileUsecase;
  late MockUploadVideoUsecase mockUploadVideoUsecase;
  late MockGetVideosUsecase mockGetVideosUsecase;

  setUp(() {
    mockGetVideoFileUsecase = MockGetVideoFileUsecase();
    mockUploadVideoUsecase = MockUploadVideoUsecase();
    mockGetVideosUsecase = MockGetVideosUsecase();

    videoCubit = VideoCubit(
      getVideoFileUsecase: mockGetVideoFileUsecase,
      uploadVideoUsecase: mockUploadVideoUsecase,
      getVideosUsecase: mockGetVideosUsecase,
    );
  });

  group('VideoCubit', () {
    const imageSource = ImageSource.camera;
    final videoFile = File('sample/video.mp4');
    const videoList = [
      VideoEntity(urlMp4: 'url', title: 'title', description: 'desc')
    ];
    const uploadVideoParams = UploadVideoParamsEntity(
      filePath: 'sample/video.mp4',
      videoTitle: 'Sample Video',
      videoDescription: 'A description of the sample video',
    );

    void successGetVideosMock() {
      when(() => mockGetVideosUsecase())
          .thenAnswer((_) async => const Right(videoList));
    }

    blocTest(
      'emits the correct states when getting a video file',
      setUp: () async {
        successGetVideosMock();
        videoCubit.getVideos();
      },
      build: () {
        when(() => mockGetVideoFileUsecase(imageSource: imageSource))
            .thenAnswer(
          (_) async => Right(videoFile),
        );
        return videoCubit;
      },
      act: (cubit) => cubit.getVideoFile(imageSource: imageSource),
      expect: () => [
        const VideoFilePickingState(videoList: videoList),
        VideoFilePickedState(
          pickedVideoFile: videoFile,
        ),
      ],
    );

    blocTest(
      'emits an error state when getting a video file fails',
      setUp: () async {
        successGetVideosMock();
        videoCubit.getVideos();
      },
      build: () {
        when(() => mockGetVideoFileUsecase(imageSource: imageSource))
            .thenAnswer(
          (_) async =>
              const Left(SkyWatchFailure(message: 'Failed to get video file')),
        );
        return videoCubit;
      },
      act: (cubit) => cubit.getVideoFile(imageSource: imageSource),
      expect: () => [
        const VideoFilePickingState(videoList: videoList),
        const VideoErrorState(message: 'Failed to get video file'),
      ],
    );

    blocTest(
      'emits the correct states when getting a null video file',
      setUp: () async {
        successGetVideosMock();
        videoCubit.getVideos();
      },
      build: () {
        when(() => mockGetVideoFileUsecase(imageSource: imageSource))
            .thenAnswer(
          (_) async => const Right(null),
        );
        return videoCubit;
      },
      act: (cubit) => cubit.getVideoFile(imageSource: imageSource),
      expect: () => [
        const VideoFilePickingState(videoList: videoList),
        const VideoFileNotPickedState(videoList: videoList),
      ],
    );

    blocTest(
      'emits the correct states when getting videos',
      build: () {
        successGetVideosMock();
        return videoCubit;
      },
      act: (cubit) => cubit.getVideos(),
      expect: () => [
        VideoLoadingState(),
        const VideoLoadedState(videoList: videoList),
      ],
    );

    blocTest(
      'emits an error state when getting videos fails',
      build: () {
        when(() => mockGetVideosUsecase()).thenAnswer(
          (_) async =>
              const Left(SkyWatchFailure(message: 'Failed to get videos')),
        );
        return videoCubit;
      },
      act: (cubit) => cubit.getVideos(),
      expect: () => [
        VideoLoadingState(),
        const VideoErrorState(message: 'Failed to get videos'),
      ],
    );

    blocTest(
      'emits the correct states when uploading a video',
      build: () {
        when(() => mockUploadVideoUsecase(
                uploadVideoParamsEntity: uploadVideoParams))
            .thenAnswer((_) async => const Right(null));
        return videoCubit;
      },
      act: (cubit) => cubit.uploadVideo(uploadVideoParams: uploadVideoParams),
      expect: () => [
        VideoFileUploadingState(),
        VideoFileUploadedState(),
      ],
    );

    blocTest(
      'emits an error state when uploading a video fails',
      build: () {
        when(() => mockUploadVideoUsecase(
            uploadVideoParamsEntity: uploadVideoParams)).thenAnswer(
          (_) async =>
              const Left(SkyWatchFailure(message: 'Failed to upload video')),
        );
        return videoCubit;
      },
      act: (cubit) => cubit.uploadVideo(uploadVideoParams: uploadVideoParams),
      expect: () => [
        VideoFileUploadingState(),
        const VideoErrorState(message: 'Failed to upload video'),
      ],
    );
  });
}
