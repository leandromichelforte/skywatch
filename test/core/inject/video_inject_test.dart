import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skywatch/core/get_it_instance/get_it_instance.dart';
import 'package:skywatch/core/inject/dio_inject.dart';
import 'package:skywatch/core/inject/video_inject.dart';
import 'package:skywatch/features/videos/data/datasources/datasources.dart';
import 'package:skywatch/features/videos/domain/repositories/repositories.dart';
import 'package:skywatch/features/videos/domain/usecases/usecases.dart';
import 'package:skywatch/features/videos/presentation/cubits/cubits.dart';

void main() {
  setUp(() {
    DioInject.inject();
    VideoInject.inject(getIt);
  });

  tearDown(() {
    getIt.reset();
  });

  test('should register ImagePicker', () {
    final imagePicker = getIt<ImagePicker>();
    expect(imagePicker, isA<ImagePicker>());
  });

  test('should register GetVideoFileDatasource', () {
    final dataSource = getIt<GetVideoFileDatasource>();
    expect(dataSource, isA<GetVideoFileDatasource>());
  });

  test('should register GetVideoFileRepository', () {
    final repository = getIt<GetVideoFileRepository>();
    expect(repository, isA<GetVideoFileRepository>());
  });

  test('should register GetVideoFileUsecase', () {
    final usecase = getIt<GetVideoFileUsecase>();
    expect(usecase, isA<GetVideoFileUsecase>());
  });

  test('should register VideosDatasource', () {
    final dataSource = getIt<VideosDatasource>();
    expect(dataSource, isA<VideosDatasource>());
  });

  test('should register UploadVideoRepository', () {
    final repository = getIt<UploadVideoRepository>();
    expect(repository, isA<UploadVideoRepository>());
  });

  test('should register GetVideosRepository', () {
    final repository = getIt<GetVideosRepository>();
    expect(repository, isA<GetVideosRepository>());
  });

  test('should register GetVideosUsecase', () {
    final usecase = getIt<GetVideosUsecase>();
    expect(usecase, isA<GetVideosUsecase>());
  });

  test('should register UploadVideoUsecase', () {
    final usecase = getIt<UploadVideoUsecase>();
    expect(usecase, isA<UploadVideoUsecase>());
  });

  test('should register VideoCubit', () {
    final cubit = getIt<VideoCubit>();
    expect(cubit, isA<VideoCubit>());
  });
}
