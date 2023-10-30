import 'package:flutter/material.dart';
import 'package:skywatch/core/constants/constants.dart';
import 'package:skywatch/core/shared_widgets/shared_widgets.dart';

class PrimaryButtonWidget extends StatelessWidget {
  const PrimaryButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
  });
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final primaryButton = SizedBox(
      width: double.maxFinite,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            ColorsConstants.primaryGrey,
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: SizeConstants.medium,
            color: Colors.white,
          ),
        ),
      ),
    );
    return isLoading ? ShimmerWidget(child: primaryButton) : primaryButton;
  }
}
