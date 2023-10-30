import 'package:flutter/material.dart';
import 'package:skywatch/core/constants/constants.dart';
import 'package:skywatch/core/resources/resources.dart';

class WindSpeedAndHumidityWidget extends StatelessWidget {
  const WindSpeedAndHumidityWidget({
    required this.windSpeed,
    required this.humidity,
    required this.fontColor,
    super.key,
  });
  final String windSpeed;
  final String humidity;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          IconPaths.windIconPath,
          color: fontColor,
          width: SizeConstants.xlarge,
        ),
        Text(
          '${windSpeed}mph',
          style: TextStyle(
            color: fontColor,
            fontSize: SizeConstants.large,
          ),
        ),
        const SizedBox(width: SizeConstants.medium),
        Image.asset(
          IconPaths.humidityIconPath,
          color: fontColor,
          width: SizeConstants.xlarge,
        ),
        Text(
          '$humidity%',
          style: TextStyle(
            color: fontColor,
            fontSize: SizeConstants.large,
          ),
        ),
      ],
    );
  }
}
