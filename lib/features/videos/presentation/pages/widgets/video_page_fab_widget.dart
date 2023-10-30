import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skywatch/core/constants/constants.dart';
import 'package:skywatch/features/videos/presentation/cubits/cubits.dart';

class VideoPageFabWidget extends StatelessWidget {
  const VideoPageFabWidget({required this.videoCubit, super.key});
  final VideoCubit videoCubit;

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      tooltip: VideosStringsConstants.uploadVideo,
      spaceBetweenChildren: SizeConstants.small,
      children: [
        SpeedDialChild(
          onTap: () => videoCubit.getVideoFile(
            imageSource: ImageSource.camera,
          ),
          child: const Icon(Icons.camera_alt_outlined),
        ),
        SpeedDialChild(
          onTap: () => videoCubit.getVideoFile(
            imageSource: ImageSource.gallery,
          ),
          child: const Icon(Icons.filter_rounded),
        ),
      ],
      child: const Icon(
        Icons.upload_rounded,
        color: Colors.white,
      ),
    );
  }
}
