import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skywatch/core/constants/constants.dart';
import 'package:skywatch/core/resources/icon_paths/icon_paths.dart';
import 'package:skywatch/core/routes/named_routes.dart';
import 'package:skywatch/core/shared_widgets/shared_widgets.dart';
import 'package:skywatch/features/videos/presentation/cubits/cubits.dart';
import 'package:skywatch/features/videos/presentation/pages/widgets/video_list_widget.dart';
import 'package:skywatch/features/videos/presentation/pages/widgets/video_page_fab_widget.dart';
import 'package:skywatch/features/videos/presentation/pages/widgets/videos_loading_body_widget.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({super.key});

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late final VideoCubit _videoCubit;

  @override
  void initState() {
    super.initState();
    _videoCubit = context.read<VideoCubit>()..getVideos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          VideosStringsConstants.videos,
        ),
      ),
      floatingActionButton: BlocBuilder<VideoCubit, VideoState>(
        bloc: _videoCubit,
        buildWhen: (_, currentState) => currentState is VideoLoadedState,
        builder: (context, state) {
          if (state is! VideoLoadedState) {
            return const SizedBox.shrink();
          }
          return VideoPageFabWidget(
            videoCubit: _videoCubit,
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: SizeConstants.xlarge),
        child: BlocConsumer<VideoCubit, VideoState>(
          bloc: _videoCubit,
          listenWhen: (_, currentState) =>
              currentState is VideoFilePickedState ||
              currentState is VideoFileNotPickedState ||
              currentState is VideoFileUploadedState,
          listener: (context, state) {
            if (state is VideoFilePickedState) {
              Navigator.pushNamed(
                context,
                NamedRoutes.uploadVideo,
              );
            }
            if (state is VideoFileNotPickedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    VideosStringsConstants.noVideoSelected,
                  ),
                ),
              );
            }
            if (state is VideoFileUploadedState) {
              _videoCubit.getVideos();
            }
          },
          buildWhen: (_, currentState) =>
              currentState is VideoErrorState ||
              currentState is VideoLoadedState ||
              currentState is VideoLoadingState,
          builder: (context, state) {
            if (state is VideoErrorState) {
              return GeneralErrorWidget(
                message: state.message,
                tryAgainCallback: _videoCubit.getVideos,
              );
            }
            if (state is VideoLoadedState) {
              if (state.videoList.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        IconPaths.emptyIconPath,
                        width: SizeConstants.xbig,
                      ),
                      const SizedBox(height: SizeConstants.xxlarge),
                      const Text(VideosStringsConstants.nothingHere),
                    ],
                  ),
                );
              }
              return VideoListWidget(
                videoList: state.videoList,
              );
            }
            return const VideosLoadingBodyWidget();
          },
        ),
      ),
    );
  }
}
