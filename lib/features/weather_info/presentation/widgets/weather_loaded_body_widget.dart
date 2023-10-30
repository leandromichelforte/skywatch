import 'package:flutter/material.dart';
import 'package:skywatch/core/constants/constants.dart';
import 'package:skywatch/features/weather_info/domain/entities/entities.dart';
import 'package:skywatch/features/weather_info/presentation/widgets/current_weather_section_widget.dart';

class WeatherLoadedBodyWidget extends StatelessWidget {
  const WeatherLoadedBodyWidget({
    required this.weatherEntity,
    super.key,
  });
  final WeatherEntity weatherEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: SizeConstants.medium,
      ),
      height: double.maxFinite,
      width: double.maxFinite,
      child: CurrentWeatherSectionWidget(
        weatherEntity: weatherEntity,
        fontColor: weatherEntity.isDay ? Colors.black : Colors.white,
      ),
    );
  }
}
