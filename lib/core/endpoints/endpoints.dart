sealed class Endpoints {
  static String getWeatherAndForecast({
    required String latitude,
    required String longitude,
  }) =>
      'http://api.weatherapi.com/v1/forecast.json?key=554250af459f4c39b5440057232610&q=$latitude,$longitude';

  static const String _videoBaseUrl = 'https://ws.api.video';
  static const String _auth = '/auth';
  static const String _videos = '/videos';

  static const String getVideoToken = '$_videoBaseUrl$_auth/api-key';
  static const String refreshVideoToken = '$_videoBaseUrl$_auth/refresh';
  static const String getVideos = '$_videoBaseUrl$_videos';
  static const String createVideo = '$_videoBaseUrl$_videos';
  static String uploadVideo({
    required String videoId,
  }) =>
      '$_videoBaseUrl$_videos/$videoId/source';
}
