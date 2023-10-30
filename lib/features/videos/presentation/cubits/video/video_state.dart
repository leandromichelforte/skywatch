part of 'video_cubit.dart';

abstract class VideoState extends Equatable {
  const VideoState();

  @override
  List<Object> get props => [];
}

final class VideoInitialState extends VideoState {}

final class VideoLoadingState extends VideoState {}

final class VideoErrorState extends VideoState {
  const VideoErrorState({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}

final class VideoLoadedState extends VideoState {
  const VideoLoadedState({
    required this.videoList,
  });
  final List<VideoEntity> videoList;

  @override
  List<Object> get props => [videoList];
}

final class VideoFilePickedState extends VideoState {
  const VideoFilePickedState({
    required this.pickedVideoFile,
  });
  final File pickedVideoFile;

  @override
  List<Object> get props => [pickedVideoFile];
}

final class VideoFileNotPickedState extends VideoLoadedState {
  const VideoFileNotPickedState({required super.videoList});
}

final class VideoFilePickingState extends VideoLoadedState {
  const VideoFilePickingState({required super.videoList});
}

final class VideoFileUploadingState extends VideoState {}

final class VideoFileUploadedState extends VideoState {}
