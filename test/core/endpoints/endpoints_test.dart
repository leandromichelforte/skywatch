import 'package:flutter_test/flutter_test.dart';
import 'package:skywatch/core/endpoints/endpoints.dart';

void main() {
  test('should return correct weather endpoint', () {
    const latitude = '123.456';
    const longitude = '789.012';
    const expectedWeatherEndpoint =
        'http://api.weatherapi.com/v1/forecast.json?key=554250af459f4c39b5440057232610&q=$latitude,$longitude';

    expect(
      Endpoints.getWeatherAndForecast(latitude: latitude, longitude: longitude),
      expectedWeatherEndpoint,
    );
  });

  test('should return correct getVideoToken endpoint', () {
    const expectedEndpoint = 'https://ws.api.video/auth/api-key';
    expect(Endpoints.getVideoToken, expectedEndpoint);
  });

  test('should return correct refreshVideoToken endpoint', () {
    const expectedEndpoint = 'https://ws.api.video/auth/refresh';
    expect(Endpoints.refreshVideoToken, expectedEndpoint);
  });

  test('should return correct getVideos endpoint', () {
    const expectedEndpoint = 'https://ws.api.video/videos';
    expect(Endpoints.getVideos, expectedEndpoint);
  });

  test('should return correct createVideo endpoint', () {
    const expectedEndpoint = 'https://ws.api.video/videos';
    expect(Endpoints.createVideo, expectedEndpoint);
  });

  test('should return correct uploadVideo endpoint', () {
    const videoId = 'abc123';
    const expectedEndpoint = 'https://ws.api.video/videos/$videoId/source';
    expect(Endpoints.uploadVideo(videoId: videoId), expectedEndpoint);
  });
}
