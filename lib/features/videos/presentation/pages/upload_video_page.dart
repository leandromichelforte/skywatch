import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skywatch/core/constants/constants.dart';
import 'package:skywatch/core/shared_widgets/shared_widgets.dart';
import 'package:skywatch/features/videos/domain/entities/entities.dart';
import 'package:skywatch/features/videos/presentation/cubits/cubits.dart';
import 'package:skywatch/features/videos/presentation/pages/widgets/upload_video_body_widget.dart';

class UploadVideoPage extends StatefulWidget {
  const UploadVideoPage({
    super.key,
  });

  @override
  State<UploadVideoPage> createState() => _UploadVideoPageState();
}

class _UploadVideoPageState extends State<UploadVideoPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final VideoCubit _videoCubit;
  late final TextEditingController _videoTitleController;
  late final TextEditingController _videoDescriptionController;
  late final File _pickedVideoFile;

  @override
  void initState() {
    super.initState();
    _videoCubit = context.read<VideoCubit>();
    _pickedVideoFile =
        (_videoCubit.state as VideoFilePickedState).pickedVideoFile;
    _videoTitleController = TextEditingController();
    _videoDescriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _videoTitleController.dispose();
    _videoDescriptionController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _videoCubit.getVideos();
        return true;
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(VideosStringsConstants.uploadVideo),
          ),
          bottomNavigationBar: BlocBuilder<VideoCubit, VideoState>(
            bloc: _videoCubit,
            builder: (context, state) {
              if (state is! VideoFilePickedState) {
                return const SizedBox.shrink();
              }
              return Padding(
                padding: const EdgeInsets.all(SizeConstants.xlarge),
                child: PrimaryButtonWidget(
                  text: VideosStringsConstants.uploadVideo,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _videoCubit.uploadVideo(
                        uploadVideoParams: UploadVideoParamsEntity(
                          filePath: _pickedVideoFile.path,
                          videoTitle: _videoTitleController.text,
                          videoDescription: _videoDescriptionController.text,
                        ),
                      );
                    }
                  },
                ),
              );
            },
          ),
          body: BlocConsumer<VideoCubit, VideoState>(
            bloc: _videoCubit,
            listener: (context, state) {
              if (state is VideoFileUploadedState) {
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              if (state is VideoFileUploadingState) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }

              if (state is VideoErrorState) {
                return GeneralErrorWidget(
                  message: state.message,
                  tryAgainCallback: () => _videoCubit.uploadVideo(
                    uploadVideoParams: UploadVideoParamsEntity(
                      filePath: _pickedVideoFile.path,
                      videoTitle: _videoTitleController.text,
                      videoDescription: _videoDescriptionController.text,
                    ),
                  ),
                );
              }

              return UploadVideoBodyWidget(
                videoPickedFile: _pickedVideoFile,
                videoDescriptionController: _videoDescriptionController,
                videoTitleController: _videoTitleController,
                formKey: _formKey,
              );
            },
          ),
        ),
      ),
    );
  }
}
