import 'package:flutter/material.dart';
import 'package:skywatch/core/constants/constants.dart';
import 'package:skywatch/core/resources/resources.dart';

class SnowAndRainChanceWidget extends StatelessWidget {
  const SnowAndRainChanceWidget(
      {required this.dailyChanceOfSnow,
      required this.dailyChanceOfRain,
      required this.fontColor,
      super.key});
  final String dailyChanceOfSnow;
  final String dailyChanceOfRain;
  final Color fontColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          IconPaths.snowIconPath,
          color: fontColor,
          width: SizeConstants.xlarge,
        ),
        const SizedBox(
          width: SizeConstants.tiny,
        ),
        Text(
          '$dailyChanceOfSnow%',
          style: TextStyle(
            fontSize: SizeConstants.large,
            color: fontColor,
          ),
        ),
        const SizedBox(width: SizeConstants.medium),
        Image.asset(
          IconPaths.rainIconPath,
          color: fontColor,
          width: SizeConstants.xlarge,
        ),
        const SizedBox(
          width: SizeConstants.tiny,
        ),
        Text(
          '$dailyChanceOfRain%',
          style: TextStyle(
            fontSize: SizeConstants.large,
            color: fontColor,
          ),
        ),
      ],
    );
  }
}
