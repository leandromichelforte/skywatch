import 'package:flutter/material.dart';
import 'package:skywatch/core/constants/constants.dart';
import 'package:skywatch/core/resources/resources.dart';
import 'package:skywatch/core/shared_widgets/shared_widgets.dart';

class GeneralErrorWidget extends StatelessWidget {
  const GeneralErrorWidget({
    required this.message,
    required this.tryAgainCallback,
    super.key,
  });
  final String message;
  final VoidCallback tryAgainCallback;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(GifPaths.error),
        const Text(
          SharedStringsConstants.somethingWentWrong,
          style: TextStyle(
            fontSize: SizeConstants.large,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: SizeConstants.medium),
        Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: SizeConstants.medium),
        ),
        const SizedBox(height: SizeConstants.medium),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: SizeConstants.xlarge,
          ),
          child: PrimaryButtonWidget(
            text: SharedStringsConstants.tryAgain,
            onPressed: tryAgainCallback,
          ),
        ),
      ],
    );
  }
}
