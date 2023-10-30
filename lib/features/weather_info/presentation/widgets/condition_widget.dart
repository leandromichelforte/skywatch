import 'package:flutter/material.dart';

class ConditionWidget extends StatelessWidget {
  const ConditionWidget({
    required this.separatorDistance,
    required this.iconWidth,
    required this.fontSize,
    required this.iconPath,
    required this.conditionText,
    required this.fontColor,
    super.key,
  });
  final double separatorDistance;
  final double iconWidth;
  final double fontSize;
  final String iconPath;
  final String conditionText;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          iconPath,
          width: iconWidth,
        ),
        SizedBox(height: separatorDistance),
        Text(
          conditionText,
          style: TextStyle(
            fontSize: fontSize,
            color: fontColor,
          ),
        ),
      ],
    );
  }
}
