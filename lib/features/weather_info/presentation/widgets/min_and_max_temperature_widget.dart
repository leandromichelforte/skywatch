import 'package:flutter/material.dart';
import 'package:skywatch/core/constants/constants.dart';
import 'package:skywatch/core/resources/resources.dart';

class MinAndMaxTemperatureWidget extends StatelessWidget {
  const MinAndMaxTemperatureWidget({
    required this.minTemperature,
    required this.maxTemperature,
    required this.fontColor,
    super.key,
  });
  final String minTemperature;
  final String maxTemperature;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          IconPaths.minTempIconPath,
          color: fontColor,
          width: SizeConstants.xlarge,
        ),
        Text(
          '$minTemperature°',
          style: TextStyle(
            fontSize: SizeConstants.xlarge,
            color: fontColor,
          ),
        ),
        const SizedBox(width: SizeConstants.medium),
        SizedBox(
          child: Image.asset(
            IconPaths.maxTempIconPath,
            color: fontColor,
            width: SizeConstants.xlarge,
          ),
        ),
        Text(
          '$maxTemperature°',
          style: TextStyle(
            fontSize: SizeConstants.xlarge,
            color: fontColor,
          ),
        ),
      ],
    );
  }
}
