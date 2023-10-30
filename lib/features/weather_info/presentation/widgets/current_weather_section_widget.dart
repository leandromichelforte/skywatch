import 'package:flutter/material.dart';
import 'package:skywatch/core/constants/constants.dart';
import 'package:skywatch/features/weather_info/domain/entities/entities.dart';
import 'package:skywatch/features/weather_info/presentation/widgets/condition_widget.dart';
import 'package:skywatch/features/weather_info/presentation/widgets/location_widget.dart';
import 'package:skywatch/features/weather_info/presentation/widgets/min_and_max_temperature_widget.dart';
import 'package:skywatch/features/weather_info/presentation/widgets/snow_and_rain_chance_widget.dart';
import 'package:skywatch/features/weather_info/presentation/widgets/temperature_widget.dart';
import 'package:skywatch/features/weather_info/presentation/widgets/wind_speed_and_humidity_widget.dart';

class CurrentWeatherSectionWidget extends StatelessWidget {
  const CurrentWeatherSectionWidget({
    super.key,
    required this.weatherEntity,
    required this.fontColor,
  });
  final WeatherEntity weatherEntity;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: SizeConstants.xxxlarge),
          LocationWidget(
            locationText:
                '${weatherEntity.city}, ${weatherEntity.state}\n${weatherEntity.country}',
            fontColor: fontColor,
          ),
          const SizedBox(height: SizeConstants.xlarge),
          ConditionWidget(
            separatorDistance: SizeConstants.large,
            iconWidth: SizeConstants.big,
            iconPath: weatherEntity.iconPath,
            conditionText: weatherEntity.condition,
            fontSize: SizeConstants.xlarge,
            fontColor: fontColor,
          ),
          const SizedBox(height: SizeConstants.xlarge),
          TemperatureWidget(
            temperature: weatherEntity.temperature,
            fontSize: SizeConstants.xxxlarge,
            fontColor: fontColor,
            celsiusImageSize: SizeConstants.xxlarge,
          ),
          const SizedBox(height: SizeConstants.xlarge),
          MinAndMaxTemperatureWidget(
            minTemperature: weatherEntity.forecast.minTemperature,
            maxTemperature: weatherEntity.forecast.maxTemperature,
            fontColor: fontColor,
          ),
          const SizedBox(height: SizeConstants.xlarge),
          WindSpeedAndHumidityWidget(
            windSpeed: weatherEntity.windSpeed,
            humidity: weatherEntity.humidity,
            fontColor: fontColor,
          ),
          const SizedBox(height: SizeConstants.xlarge),
          SnowAndRainChanceWidget(
            dailyChanceOfSnow: weatherEntity.forecast.dailyChanceOfSnow,
            dailyChanceOfRain: weatherEntity.forecast.dailyChanceOfRain,
            fontColor: fontColor,
          ),
          const SizedBox(height: SizeConstants.xxlarge),
        ],
      ),
    );
  }
}
