import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:skywatch/features/videos/presentation/pages/widgets/file_player_widget.dart';

import '../../../../../core/fake_video_player_platform.dart';

void main() {
  videoPlayerPlatformInstance;
  late Widget filePlayerWidget;
  late File videoFile;

  setUp(() {
    videoFile = File('path/to/your/test/video.mp4');
    filePlayerWidget = MaterialApp(
      home: Scaffold(
        body: FilePlayerWidget(
          videoFile: videoFile,
        ),
      ),
    );
  });
  testWidgets('FilePlayerWidget should have a Chewie player',
      (WidgetTester tester) async {
    await tester.pumpWidget(filePlayerWidget);
    expect(find.byType(FilePlayerWidget), findsOneWidget);
    expect(find.byType(Chewie), findsOneWidget);
  });
}
