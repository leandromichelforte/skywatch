import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:skywatch/features/videos/domain/entities/entities.dart';
import 'package:skywatch/features/videos/presentation/pages/widgets/network_player_widget.dart';
import 'package:skywatch/features/videos/presentation/pages/widgets/video_list_widget.dart';

import '../../../../../core/fake_video_player_platform.dart';

void main() {
  videoPlayerPlatformInstance;
  group('VideoListWidget', () {
    testWidgets('VideoListWidget should render correctly',
        (WidgetTester tester) async {
      const videoList = [
        VideoEntity(
          urlMp4: 'video_url_1.mp4',
          title: 'Video 1',
          description: 'Description 1',
        ),
        VideoEntity(
          urlMp4: 'video_url_2.mp4',
          title: 'Video 2',
          description: 'Description 2',
        ),
      ];

      const widget = VideoListWidget(videoList: videoList);

      await tester.pumpWidget(const MaterialApp(home: Scaffold(body: widget)));
      expect(find.byType(NetworkPlayerWidget), findsNWidgets(videoList.length));
      expect(find.text('Video 1'), findsOneWidget);
      expect(find.text('Description 1'), findsOneWidget);
      expect(find.text('Video 2'), findsOneWidget);
      expect(find.text('Description 2'), findsOneWidget);
    });
  });
}
