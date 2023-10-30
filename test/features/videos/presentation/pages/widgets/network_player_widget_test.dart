import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:skywatch/features/videos/presentation/pages/widgets/network_player_widget.dart';
import '../../../../../core/fake_video_player_platform.dart';

void main() {
  videoPlayerPlatformInstance;
  late Widget filePlayerWidget;

  setUp(() {
    filePlayerWidget = const MaterialApp(
      home: Scaffold(
        body: NetworkPlayerWidget(
          videoUrl: 'path/to/your/test/video.mp4',
        ),
      ),
    );
  });

  testWidgets('NetworkPlayerWidget should have a Chewie player',
      (WidgetTester tester) async {
    await tester.pumpWidget(filePlayerWidget);
    expect(find.byType(Chewie), findsOneWidget);
    expect(find.byType(NetworkPlayerWidget), findsOneWidget);
  });
}
