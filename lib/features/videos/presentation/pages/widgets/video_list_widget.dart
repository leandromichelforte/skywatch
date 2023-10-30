import 'package:flutter/material.dart';
import 'package:skywatch/core/constants/constants.dart';
import 'package:skywatch/features/videos/domain/entities/entities.dart';
import 'package:skywatch/features/videos/presentation/pages/widgets/network_player_widget.dart';

class VideoListWidget extends StatelessWidget {
  const VideoListWidget({required this.videoList, super.key});
  final List<VideoEntity> videoList;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final item = videoList[index];
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: SizeConstants.xlarge,
          ),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(
                SizeConstants.middle,
              ),
            ),
            gradient: LinearGradient(
              colors: [
                Theme.of(context).highlightColor,
                Theme.of(context).scaffoldBackgroundColor,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              NetworkPlayerWidget(
                videoUrl: item.urlMp4,
              ),
              const SizedBox(
                height: SizeConstants.small,
              ),
              Text(
                item.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: SizeConstants.medium,
                ),
              ),
              const SizedBox(
                height: SizeConstants.tiny,
              ),
              Text(
                item.description,
              ),
              const SizedBox(
                height: SizeConstants.small,
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) =>
          const SizedBox(height: SizeConstants.large),
      itemCount: videoList.length,
    );
  }
}
