import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:skywatch/core/constants/constants.dart';
import 'package:skywatch/features/videos/presentation/pages/widgets/custom_text_form_field_widget.dart';
import 'package:skywatch/features/videos/presentation/pages/widgets/file_player_widget.dart';
import 'package:skywatch/features/videos/presentation/pages/widgets/upload_video_body_widget.dart';
import '../../../../../core/fake_video_player_platform.dart';

void main() {
  videoPlayerPlatformInstance;
  group('UploadVideoBodyWidget', () {
    late File videoPickedFile;
    late TextEditingController videoTitleController;
    late TextEditingController videoDescriptionController;
    late GlobalKey<FormState> formKey;

    setUp(() {
      videoPickedFile = File('fake_video.mp4');
      videoTitleController = TextEditingController();
      videoDescriptionController = TextEditingController();
      formKey = GlobalKey<FormState>();
    });

    testWidgets('UploadVideoBodyWidget should render correctly',
        (WidgetTester tester) async {
      final widget = UploadVideoBodyWidget(
        videoPickedFile: videoPickedFile,
        videoTitleController: videoTitleController,
        videoDescriptionController: videoDescriptionController,
        formKey: formKey,
      );

      await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));

      expect(find.text(VideosStringsConstants.setTitleAndDescription),
          findsOneWidget);
      expect(find.byType(FilePlayerWidget), findsOneWidget);
      expect(find.byType(CustomTextFormFieldWidget), findsNWidgets(2));
    });

    testWidgets('UploadVideoBodyWidget should display the provided video file',
        (WidgetTester tester) async {
      final widget = UploadVideoBodyWidget(
        videoPickedFile: videoPickedFile,
        videoTitleController: videoTitleController,
        videoDescriptionController: videoDescriptionController,
        formKey: formKey,
      );

      await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));

      final filePlayerFinder = find.byType(FilePlayerWidget);
      expect(filePlayerFinder, findsOneWidget);
    });

    testWidgets(
        'UploadVideoBodyWidget should have two CustomTextFormFieldWidgets',
        (WidgetTester tester) async {
      final widget = UploadVideoBodyWidget(
        videoPickedFile: videoPickedFile,
        videoTitleController: videoTitleController,
        videoDescriptionController: videoDescriptionController,
        formKey: formKey,
      );

      await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));

      final customTextFormFieldFinder = find.byType(CustomTextFormFieldWidget);
      expect(customTextFormFieldFinder, findsNWidgets(2));
    });
  });
}
