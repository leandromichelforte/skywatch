import 'dart:io';

import 'package:dio/dio.dart';
import 'package:skywatch/core/constants/constants.dart';
import 'package:skywatch/core/endpoints/endpoints.dart';
import 'package:skywatch/core/errors/exceptions/exceptions.dart';
import 'package:skywatch/features/videos/data/datasources/datasources.dart';
import 'package:skywatch/features/videos/data/models/models.dart';

final class VideosDatasourceImpl implements VideosDatasource {
  const VideosDatasourceImpl({
    required Dio dio,
  }) : _dio = dio;
  final Dio _dio;

  @override
  Future<void> uploadVideo({
    required UploadVideoParamsModel uploadVideoParamsModel,
  }) async {
    try {
      await _getToken();
      final videoId = await _createVideo(
        data: uploadVideoParamsModel.titleAndDescriptionToMap(),
      );
      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(uploadVideoParamsModel.filePath),
      });
      await _dio.post(
        Endpoints.uploadVideo(
          videoId: videoId,
        ),
        data: formData,
      );
      return;
    } on ConnectionException catch (_) {
      rethrow;
    } on ApiException catch (_) {
      rethrow;
    } on DioException catch (exception) {
      if (exception.error is SocketException) {
        throw ConnectionException(error: exception);
      }
      throw ApiException(
        error: exception,
      );
    } catch (exception) {
      throw GenericException(
        message: SharedStringsConstants.occurredAnErrorTryAgain,
        error: exception,
      );
    }
  }

  @override
  Future<List<VideoModel>> getVideos() async {
    try {
      await _getToken();
      final response = await _dio.get(Endpoints.getVideos);
      return response.data['data']
          .map<VideoModel>((e) => VideoModel.fromMap(map: e))
          .toList()
          .reversed
          .toList();
    } on ConnectionException catch (_) {
      rethrow;
    } on ApiException catch (_) {
      rethrow;
    } on DioException catch (exception) {
      if (exception.error is SocketException) {
        throw ConnectionException(error: exception);
      }
      throw ApiException(
        error: exception,
      );
    } catch (exception) {
      throw GenericException(
        message: SharedStringsConstants.occurredAnErrorTryAgain,
        error: exception,
      );
    }
  }

  Future<void> _getToken() async {
    try {
      final response = await _dio.post(
        Endpoints.getVideoToken,
        data: {
          'apiKey': VideosStringsConstants.apiKey,
        },
      );
      final String token = response.data['access_token'];
      _dio.options.headers['Authorization'] = 'Bearer $token';
      return;
    } on DioException catch (exception) {
      if (exception.error is SocketException) {
        throw ConnectionException(error: exception);
      }
      throw ApiException(
        error: exception,
      );
    } catch (exception) {
      throw GenericException(
        message: SharedStringsConstants.occurredAnErrorTryAgain,
        error: exception,
      );
    }
  }

  Future<String> _createVideo({
    required Map<String, String> data,
  }) async {
    try {
      final response = await _dio.post(
        Endpoints.createVideo,
        data: data,
      );
      return response.data['videoId'];
    } on DioException catch (exception) {
      if (exception.error is SocketException) {
        throw ConnectionException(error: exception);
      }
      throw ApiException(
        error: exception,
      );
    } catch (exception) {
      throw GenericException(
        message: SharedStringsConstants.occurredAnErrorTryAgain,
        error: exception,
      );
    }
  }
}
