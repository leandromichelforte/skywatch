import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skywatch/features/videos/domain/entities/entities.dart';
import 'package:skywatch/features/videos/domain/usecases/usecases.dart';

part 'video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  VideoCubit({
    required GetVideoFileUsecase getVideoFileUsecase,
    required UploadVideoUsecase uploadVideoUsecase,
    required GetVideosUsecase getVideosUsecase,
  })  : _getVideoFileUsecase = getVideoFileUsecase,
        _uploadVideoUsecase = uploadVideoUsecase,
        _getVideosUsecase = getVideosUsecase,
        super(VideoInitialState());
  final GetVideoFileUsecase _getVideoFileUsecase;
  final UploadVideoUsecase _uploadVideoUsecase;
  final GetVideosUsecase _getVideosUsecase;

  Future<void> getVideoFile({required ImageSource imageSource}) async {
    final currentState = state as VideoLoadedState;
    emit(VideoFilePickingState(videoList: currentState.videoList));
    final getVideoFileEither = await _getVideoFileUsecase(
      imageSource: imageSource,
    );
    getVideoFileEither.fold((failure) {
      emit(
        VideoErrorState(
          message: failure.message,
        ),
      );
    }, (file) {
      if (file != null) {
        emit(
          VideoFilePickedState(
            pickedVideoFile: file,
          ),
        );
      } else {
        emit(
          VideoFileNotPickedState(
            videoList: currentState.videoList,
          ),
        );
      }
    });
  }

  Future<void> getVideos() async {
    emit(VideoLoadingState());
    final uploadVideoEither = await _getVideosUsecase();
    uploadVideoEither.fold((failure) {
      emit(
        VideoErrorState(
          message: failure.message,
        ),
      );
    }, (videoList) {
      emit(
        VideoLoadedState(
          videoList: videoList,
        ),
      );
    });
  }

  Future<void> uploadVideo({
    required UploadVideoParamsEntity uploadVideoParams,
  }) async {
    emit(VideoFileUploadingState());
    final uploadVideoEither = await _uploadVideoUsecase(
      uploadVideoParamsEntity: uploadVideoParams,
    );
    uploadVideoEither.fold((failure) {
      emit(
        VideoErrorState(
          message: failure.message,
        ),
      );
    }, (_) {
      emit(VideoFileUploadedState());
    });
  }
}
