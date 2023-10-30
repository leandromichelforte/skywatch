import 'package:flutter/material.dart';
import 'package:skywatch/core/resources/resources.dart';

class TemperatureWidget extends StatelessWidget {
  const TemperatureWidget({
    super.key,
    required this.temperature,
    required this.fontSize,
    required this.fontColor,
    required this.celsiusImageSize,
  });
  final String temperature;
  final double fontSize;
  final Color fontColor;
  final double celsiusImageSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          temperature,
          style: TextStyle(
            fontSize: fontSize,
            color: fontColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        Image.asset(
          IconPaths.celsiusIconPath,
          width: celsiusImageSize,
        ),
      ],
    );
  }
}
