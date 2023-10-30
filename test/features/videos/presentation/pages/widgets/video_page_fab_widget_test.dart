import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skywatch/features/videos/presentation/cubits/cubits.dart';
import 'package:skywatch/features/videos/presentation/pages/widgets/video_page_fab_widget.dart';

class MockVideoCubit extends Mock implements VideoCubit {}

void main() {
  late VideoCubit videoCubit;
  setUp(() {
    videoCubit = MockVideoCubit();
  });
  group('VideoPageFabWidget', () {
    testWidgets(
        'VideoPageFabWidget should render correctly and tap the gallery button',
        (WidgetTester tester) async {
      when(
        () => videoCubit.getVideoFile(imageSource: ImageSource.gallery),
      ).thenAnswer((invocation) async => {});
      final widget = VideoPageFabWidget(videoCubit: videoCubit);

      await tester.pumpWidget(
          MaterialApp(home: Scaffold(floatingActionButton: widget)));
      await tester.pumpAndSettle();

      expect(find.byType(SpeedDial), findsOneWidget);
      await tester.tap(find.byIcon(Icons.upload_rounded));
      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.filter_rounded), findsOneWidget);
      await tester.tap(find.byIcon(Icons.filter_rounded));
      await tester.pumpAndSettle();
    });
    testWidgets(
        'VideoPageFabWidget should render correctly and tap the camera button',
        (WidgetTester tester) async {
      when(
        () => videoCubit.getVideoFile(imageSource: ImageSource.camera),
      ).thenAnswer((invocation) async => {});
      final widget = VideoPageFabWidget(videoCubit: videoCubit);

      await tester.pumpWidget(
          MaterialApp(home: Scaffold(floatingActionButton: widget)));
      await tester.pumpAndSettle();

      expect(find.byType(SpeedDial), findsOneWidget);
      await tester.tap(find.byIcon(Icons.upload_rounded));
      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.camera_alt_outlined), findsOneWidget);
      await tester.tap(find.byIcon(Icons.camera_alt_outlined));
      await tester.pumpAndSettle();
    });
  });
}
