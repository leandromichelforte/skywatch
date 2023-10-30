import 'package:flutter_test/flutter_test.dart';
import 'package:skywatch/core/constants/strings/videos_strings_constants.dart';

void main() {
  test('should return Upload Video', () {
    expect(VideosStringsConstants.uploadVideo, 'Upload Video');
  });

  test('should return Camera', () {
    expect(VideosStringsConstants.camera, 'Camera');
  });

  test('should return Gallery', () {
    expect(VideosStringsConstants.gallery, 'Gallery');
  });

  test('should return List', () {
    expect(VideosStringsConstants.list, 'List');
  });

  test('should return Title', () {
    expect(VideosStringsConstants.title, 'Title');
  });

  test('should return Description', () {
    expect(VideosStringsConstants.description, 'Description');
  });

  test('should return Required field', () {
    expect(VideosStringsConstants.requiredField, 'Required field');
  });

  test('should return Videos', () {
    expect(VideosStringsConstants.videos, 'Videos');
  });

  test('should return eMjiyRZ4OpvrRKf30OLQL9PZa01hb0gxSlzCTJ1wCyZ', () {
    expect(VideosStringsConstants.apiKey,
        'eMjiyRZ4OpvrRKf30OLQL9PZa01hb0gxSlzCTJ1wCyZ');
  });

  test('should return Set video title and description', () {
    expect(VideosStringsConstants.setTitleAndDescription,
        'Set video title and description');
  });

  test('should return No video selected', () {
    expect(VideosStringsConstants.noVideoSelected, 'No video selected');
  });
  test('should return Nothing here', () {
    expect(VideosStringsConstants.nothingHere, 'Nothing here');
  });
}
