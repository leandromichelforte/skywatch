import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:skywatch/core/constants/strings/strings.dart';
import 'package:skywatch/core/endpoints/endpoints.dart';
import 'package:skywatch/core/errors/exceptions/exceptions.dart';
import 'package:skywatch/features/videos/data/datasources/datasources.dart';
import 'package:skywatch/features/videos/data/models/models.dart';
import 'package:mocktail/mocktail.dart';

class MockFormData extends Mock implements FormData {}

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  group('VideosDatasourceImpl', () {
    late VideosDatasourceImpl datasource;

    setUp(() {
      dio = Dio(BaseOptions());
      dioAdapter = DioAdapter(dio: dio);
      datasource = VideosDatasourceImpl(dio: dio);
    });
    test('uploadVideo should throw a ConnectionException on SocketException',
        () async {
      const uploadVideoParams = UploadVideoParamsModel(
        videoTitle: 'Video Title',
        videoDescription: 'Video Description',
        filePath: 'video_path.mp4',
      );

      dioAdapter.onPost(
        Endpoints.getVideoToken,
        data: {'apiKey': VideosStringsConstants.apiKey},
        (server) => server.reply(201, {'access_token': 'fake_token'}),
      );
      dioAdapter.onPost(
        Endpoints.createVideo,
        data: uploadVideoParams.titleAndDescriptionToMap(),
        (server) => server.throws(
            400,
            DioException(
                error: const SocketException('message'),
                requestOptions: RequestOptions())),
      );

      expect(
        () => datasource.uploadVideo(uploadVideoParamsModel: uploadVideoParams),
        throwsA(
          isA<ConnectionException>(),
        ),
      );
    });

    test('getVideos returns a list of VideoModel', () async {
      final sampleResponse = {
        "data": [
          {
            "title": "video_test",
            "description": "@@@@@",
            "assets": {
              "mp4":
                  "https://vod.api.video/vod/vi7eU2kwz3UuOU1PySdJ8gks/mp4/source.mp4"
            }
          }
        ],
      };
      dioAdapter.onPost(
        Endpoints.getVideoToken,
        data: {'apiKey': VideosStringsConstants.apiKey},
        (server) => server.reply(201, {'access_token': 'fake_token'}),
      );

      dioAdapter.onGet(
        Endpoints.getVideos,
        (server) => server.reply(201, sampleResponse),
      );

      final videos = await datasource.getVideos();
      expect(videos.length, 1);
      expect(videos.first.title, 'video_test');
      expect(videos.first.description, '@@@@@');
      expect(videos.first.urlMp4,
          'https://vod.api.video/vod/vi7eU2kwz3UuOU1PySdJ8gks/mp4/source.mp4');
    });
  });
}
