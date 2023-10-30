import 'dart:io';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:skywatch/core/constants/constants.dart';
import 'package:video_player/video_player.dart';

class FilePlayerWidget extends StatefulWidget {
  const FilePlayerWidget({
    required this.videoFile,
    super.key,
  });

  final File videoFile;

  @override
  State<FilePlayerWidget> createState() => _FilePlayerWidgetState();
}

class _FilePlayerWidgetState extends State<FilePlayerWidget> {
  late final VideoPlayerController _videoPlayerController;
  late final ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.file(
      widget.videoFile,
    );
    _chewieController = ChewieController(
      autoInitialize: true,
      autoPlay: true,
      looping: true,
      videoPlayerController: _videoPlayerController,
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConstants.xxbig,
      width: SizeConstants.xxbig,
      child: Chewie(
        controller: _chewieController,
      ),
    );
  }
}
