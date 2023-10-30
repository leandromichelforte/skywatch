import 'package:flutter/material.dart';
import 'package:skywatch/core/constants/constants.dart';
import 'package:skywatch/core/resources/resources.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    super.key,
    required this.locationText,
    required this.fontColor,
  });
  final String locationText;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          IconPaths.locationIconPath,
          color: fontColor,
          width: SizeConstants.xxlarge,
        ),
        const SizedBox(width: SizeConstants.small),
        Flexible(
          child: Text(
            locationText,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: SizeConstants.medium,
              fontWeight: FontWeight.bold,
              color: fontColor,
            ),
          ),
        ),
      ],
    );
  }
}
