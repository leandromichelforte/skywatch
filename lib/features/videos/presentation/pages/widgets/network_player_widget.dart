import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:skywatch/core/constants/constants.dart';
import 'package:video_player/video_player.dart';

class NetworkPlayerWidget extends StatefulWidget {
  const NetworkPlayerWidget({
    required this.videoUrl,
    super.key,
  });

  final String videoUrl;

  @override
  State<NetworkPlayerWidget> createState() => _NetworkPlayerWidgetState();
}

class _NetworkPlayerWidgetState extends State<NetworkPlayerWidget> {
  late final VideoPlayerController _videoPlayerController;
  late final ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(widget.videoUrl),
    );
    _chewieController = ChewieController(
      autoInitialize: true,
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
