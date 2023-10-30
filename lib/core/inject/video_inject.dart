import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skywatch/features/videos/data/datasources/datasources.dart';
import 'package:skywatch/features/videos/data/repositories/repositories.dart';
import 'package:skywatch/features/videos/domain/repositories/repositories.dart';
import 'package:skywatch/features/videos/domain/usecases/usecases.dart';
import 'package:skywatch/features/videos/presentation/cubits/cubits.dart';

sealed class VideoInject {
  static void inject(GetIt getIt) {
    getIt.registerFactory(() => ImagePicker());
    getIt.registerFactory<GetVideoFileDatasource>(
      () => GetVideoFileDatasourceImpl(
        imagePicker: getIt.get<ImagePicker>(),
      ),
    );
    getIt.registerFactory<GetVideoFileRepository>(
      () => GetVideoFileRepositoryImpl(
        getVideoFileDatasource: getIt.get<GetVideoFileDatasource>(),
      ),
    );
    getIt.registerFactory<GetVideoFileUsecase>(
      () => GetVideoFileUsecaseImpl(
        getVideoFileRepository: getIt.get<GetVideoFileRepository>(),
      ),
    );
    getIt.registerFactory<VideosDatasource>(
      () => VideosDatasourceImpl(dio: getIt.get<Dio>()),
    );
    getIt.registerFactory<UploadVideoRepository>(
      () => UploadVideoRepositoryImpl(
        videosDatasource: getIt.get<VideosDatasource>(),
      ),
    );
    getIt.registerFactory<GetVideosRepository>(
      () => GetVideosRepositoryImpl(
        uploadVideoDatasource: getIt.get<VideosDatasource>(),
      ),
    );
    getIt.registerFactory<GetVideosUsecase>(
      () => GetVideosUsecaseImpl(
        getVideosRepository: getIt.get<GetVideosRepository>(),
      ),
    );
    getIt.registerFactory<UploadVideoUsecase>(
      () => UploadVideoUsecaseImpl(
        uploadVideoRepository: getIt.get<UploadVideoRepository>(),
      ),
    );
    getIt.registerLazySingleton(
      () => VideoCubit(
        getVideoFileUsecase: getIt.get<GetVideoFileUsecase>(),
        uploadVideoUsecase: getIt.get<UploadVideoUsecase>(),
        getVideosUsecase: getIt.get<GetVideosUsecase>(),
      ),
    );
  }
}
