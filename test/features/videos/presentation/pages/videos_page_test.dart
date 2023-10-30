import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skywatch/core/constants/strings/strings.dart';
import 'package:skywatch/core/routes/named_routes.dart';
import 'package:skywatch/core/shared_widgets/shared_widgets.dart';
import 'package:skywatch/features/videos/domain/entities/entities.dart';
import 'package:skywatch/features/videos/presentation/cubits/cubits.dart';
import 'package:skywatch/features/videos/presentation/pages/videos_page.dart';
import 'package:skywatch/features/videos/presentation/pages/widgets/video_list_widget.dart';
import 'package:skywatch/features/videos/presentation/pages/widgets/videos_loading_body_widget.dart';

import '../../../../core/core_mocktail.dart';
import '../../../../core/fake_video_player_platform.dart';

class MockVideoCubit extends MockCubit<VideoState> implements VideoCubit {}

void main() {
  videoPlayerPlatformInstance;
  late VideoCubit videoCubit;
  late NavigatorObserver navigatorObserver;
  setUp(() {
    navigatorObserver = MockNavigatorObserver();
    videoCubit = MockVideoCubit();
    when(
      () => videoCubit.getVideos(),
    ).thenAnswer(
      (_) async {},
    );
  });
  setUpAll(() {
    registerFallbackValue(MockRoute());
  });

  group('VideoPage Widget', () {
    testWidgets('Renders VideoListWidget when VideoLoadedState is received',
        (WidgetTester tester) async {
      when(() => videoCubit.state).thenReturn(const VideoLoadedState(
          videoList: [
            VideoEntity(
                urlMp4: 'urlMp4', title: 'title', description: 'description')
          ]));

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: videoCubit,
            child: const VideoPage(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(VideoListWidget), findsOneWidget);
    });

    testWidgets(
        'should find Nothing here text when VideoLoadedState is received with empty list',
        (WidgetTester tester) async {
      when(() => videoCubit.state)
          .thenReturn(const VideoLoadedState(videoList: []));

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: videoCubit,
            child: const VideoPage(),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text(VideosStringsConstants.nothingHere), findsOneWidget);
    });

    testWidgets(
        'Renders VideosLoadingBodyWidget when VideoLoadingState is received',
        (WidgetTester tester) async {
      when(() => videoCubit.state).thenReturn(VideoLoadingState());

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: videoCubit,
            child: const VideoPage(),
          ),
        ),
      );

      expect(find.byType(VideosLoadingBodyWidget), findsOneWidget);
    });

    testWidgets('Renders GeneralErrorWidget when VideoErrorState is received',
        (WidgetTester tester) async {
      when(() => videoCubit.state)
          .thenReturn(const VideoErrorState(message: 'Error message'));

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: videoCubit,
            child: const VideoPage(),
          ),
        ),
      );

      expect(find.byType(GeneralErrorWidget), findsOneWidget);
      expect(find.text('Error message'), findsOneWidget);
    });

    testWidgets('Shows Snackbar when VideoFileNotPickedState is received',
        (WidgetTester tester) async {
      when(() => videoCubit.state)
          .thenReturn(const VideoFileNotPickedState(videoList: []));

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: videoCubit,
            child: const VideoPage(),
          ),
        ),
      );

      await tester.pumpAndSettle();
    });

    testWidgets(
        'Navigates to UploadVideoPage when VideoFilePickedState is received',
        (WidgetTester tester) async {
      when(() => videoCubit.state).thenReturn(
          VideoFilePickedState(pickedVideoFile: File('sample.mp4')));

      await tester.pumpWidget(
        MaterialApp(
          navigatorObservers: [navigatorObserver],
          home: BlocProvider.value(
            value: videoCubit,
            child: const VideoPage(),
          ),
          routes: {
            NamedRoutes.uploadVideo: (context) => const SizedBox.shrink(),
          },
        ),
      );

      await tester.pump();

      verify(
        () => navigatorObserver.didPush(any(), any()),
      ).called(1);
    });
  });
}
