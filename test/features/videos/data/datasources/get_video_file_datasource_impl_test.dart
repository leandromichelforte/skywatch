import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skywatch/core/constants/strings/strings.dart';
import 'package:skywatch/core/errors/exceptions/exceptions.dart';
import 'package:skywatch/features/videos/data/datasources/datasources.dart';
import 'package:image_picker/image_picker.dart';

class MockImagePicker extends Mock implements ImagePicker {}

void main() {
  group('GetVideoFileDatasourceImpl', () {
    late GetVideoFileDatasourceImpl datasource;
    late MockImagePicker mockImagePicker;

    setUp(() {
      mockImagePicker = MockImagePicker();
      datasource = GetVideoFileDatasourceImpl(imagePicker: mockImagePicker);
    });

    test('should call ImagePicker.pickVideo with the specified source',
        () async {
      when(
        () => mockImagePicker.pickVideo(
          source: ImageSource.camera,
        ),
      ).thenAnswer((_) async => XFile(''));

      final result = await datasource(imageSource: ImageSource.camera);

      verify(
        () => mockImagePicker.pickVideo(
          source: ImageSource.camera,
        ),
      ).called(1);
      expect(result, isA<File>());
    });

    test('should return null when ImagePicker.pickVideo returns null',
        () async {
      when(
        () => mockImagePicker.pickVideo(
          source: ImageSource.gallery,
        ),
      ).thenAnswer((_) async => null);

      final result = await datasource(imageSource: ImageSource.gallery);

      verify(
        () => mockImagePicker.pickVideo(
          source: ImageSource.gallery,
        ),
      ).called(1);
      expect(result, isNull);
    });

    test('should throw a GenericException on ImagePicker.pickVideo error',
        () async {
      when(
        () => mockImagePicker.pickVideo(
          source: ImageSource.camera,
        ),
      ).thenThrow(Exception('ImagePicker error'));

      try {
        await datasource(imageSource: ImageSource.gallery);
        fail('Expected an exception to be thrown');
      } catch (e) {
        expect(e, isA<GenericException>());
        expect((e as GenericException).message,
            SharedStringsConstants.occurredAnErrorTryAgain);
      }
    });
  });
}
