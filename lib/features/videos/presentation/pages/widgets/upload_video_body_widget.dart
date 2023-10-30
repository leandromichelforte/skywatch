import 'dart:io';
import 'package:flutter/material.dart';
import 'package:skywatch/core/constants/constants.dart';
import 'package:skywatch/features/videos/presentation/pages/widgets/custom_text_form_field_widget.dart';
import 'package:skywatch/features/videos/presentation/pages/widgets/file_player_widget.dart';

class UploadVideoBodyWidget extends StatelessWidget {
  const UploadVideoBodyWidget({
    required this.videoPickedFile,
    required this.videoDescriptionController,
    required this.videoTitleController,
    required this.formKey,
    super.key,
  });
  final File videoPickedFile;
  final TextEditingController videoTitleController;
  final TextEditingController videoDescriptionController;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: SizeConstants.xlarge),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  VideosStringsConstants.setTitleAndDescription,
                  style: TextStyle(fontSize: SizeConstants.large),
                ),
                const SizedBox(height: SizeConstants.xlarge),
                FilePlayerWidget(
                  videoFile: videoPickedFile,
                ),
                const SizedBox(height: SizeConstants.xlarge),
                CustomTextFormFieldWidget(
                  controller: videoTitleController,
                  hintText: VideosStringsConstants.title,
                ),
                const SizedBox(height: SizeConstants.large),
                CustomTextFormFieldWidget(
                  controller: videoDescriptionController,
                  hintText: VideosStringsConstants.description,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
