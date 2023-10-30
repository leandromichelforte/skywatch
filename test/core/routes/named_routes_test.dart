import 'package:flutter_test/flutter_test.dart';
import 'package:skywatch/core/routes/named_routes.dart';

void main() {
  test('should return the correct home route', () {
    expect(NamedRoutes.home, '/home');
  });

  test('should return the correct weather route', () {
    expect(NamedRoutes.weather, '/weather');
  });

  test('should return the correct forecast route', () {
    expect(NamedRoutes.forecast, '/forecast');
  });

  test('should return the correct videos route', () {
    expect(NamedRoutes.videos, '/videos');
  });

  test('should return the correct uploadVideo route', () {
    expect(NamedRoutes.uploadVideo, '/upload-video');
  });
}
