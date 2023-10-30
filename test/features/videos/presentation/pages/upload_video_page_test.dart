import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skywatch/core/shared_widgets/shared_widgets.dart';
import 'package:skywatch/features/videos/domain/entities/upload_video_params_entity.dart';
import 'package:skywatch/features/videos/presentation/cubits/cubits.dart';
import 'package:skywatch/features/videos/presentation/pages/upload_video_page.dart';

import '../../../../core/core_mocktail.dart';
import '../../../../core/fake_video_player_platform.dart';

class MockVideoCubit extends MockCubit<VideoState> implements VideoCubit {}

void main() {
  videoPlayerPlatformInstance;
  late NavigatorObserver navigatorObserver;
  group('UploadVideoPage', () {
    late MockVideoCubit videoCubit;
    final pickedVideoFile = File('sample/video.mp4');

    setUp(() {
      videoCubit = MockVideoCubit();
      navigatorObserver = MockNavigatorObserver();
    });

    setUpAll(() {
      registerFallbackValue(
        const UploadVideoParamsEntity(
          filePath: 'sample/video.mp4',
          videoTitle: 'videoTitle',
          videoDescription: 'videoDescription',
        ),
      );
      registerFallbackValue(MockRoute());
    });

    testWidgets('UploadVideoPage should render GeneralErrorWidget',
        (WidgetTester tester) async {
      when(() => videoCubit.state)
          .thenReturn(VideoFilePickedState(pickedVideoFile: pickedVideoFile));
      const widget = UploadVideoPage();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BlocProvider<VideoCubit>.value(
              value: videoCubit,
              child: widget,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      when(() => videoCubit.state)
          .thenReturn(const VideoErrorState(message: 'Upload failed'));
      when(() => videoCubit.uploadVideo(
            uploadVideoParams: any(
              named: 'uploadVideoParams',
            ),
          )).thenAnswer((_) async {
        return videoCubit.emit(const VideoErrorState(message: 'Upload failed'));
      });
      await tester.tap(find.byType(PrimaryButtonWidget));
      await tester.pumpAndSettle();
    });

    testWidgets('UploadVideoPage should navigate after upload',
        (WidgetTester tester) async {
      when(() => videoCubit.state)
          .thenReturn(VideoFilePickedState(pickedVideoFile: pickedVideoFile));
      const widget = UploadVideoPage();
      await tester.pumpWidget(
        MaterialApp(
          navigatorObservers: [navigatorObserver],
          home: Scaffold(
            body: BlocProvider<VideoCubit>.value(
              value: videoCubit,
              child: widget,
            ),
          ),
        ),
      );
      when(() => videoCubit.uploadVideo(
            uploadVideoParams: any(
              named: 'uploadVideoParams',
              that: isA<UploadVideoParamsEntity>(),
            ),
          )).thenAnswer((_) async => const Right(null));
      await tester.tap(find.byType(PrimaryButtonWidget));
      await tester.pumpAndSettle();
      verify(() => navigatorObserver.didPush(any(), any())).called(1);
    });
  });
}
