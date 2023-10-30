import 'package:flutter/material.dart';
import 'package:skywatch/core/constants/constants.dart';
import 'package:skywatch/features/weather_info/domain/entities/entities.dart';
import 'package:skywatch/features/weather_info/presentation/widgets/condition_widget.dart';
import 'package:skywatch/features/weather_info/presentation/widgets/temperature_widget.dart';

class HourlyForecastListWidget extends StatefulWidget {
  const HourlyForecastListWidget({
    required this.weatherEntity,
    super.key,
  });
  final WeatherEntity weatherEntity;

  @override
  State<HourlyForecastListWidget> createState() =>
      _HourlyForecastListWidgetState();
}

class _HourlyForecastListWidgetState extends State<HourlyForecastListWidget> {
  late final Color fontColor;

  @override
  void initState() {
    super.initState();
    fontColor = widget.weatherEntity.isDay ? Colors.black : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: widget.weatherEntity.forecast.hourlyForecastList
            .map(
              (hourlyForecastItem) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: SizeConstants.xlarge,
                  vertical: SizeConstants.small,
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: SizeConstants.small,
                      horizontal: SizeConstants.medium),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(
                        SizeConstants.medium,
                      ),
                    ),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: widget.weatherEntity.isDay
                            ? [
                                ColorsConstants.dayColorLight,
                                ColorsConstants.dayColor,
                              ]
                            : [
                                ColorsConstants.nightColorLight,
                                ColorsConstants.nightColor,
                              ]),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TemperatureWidget(
                        temperature: hourlyForecastItem.temperature,
                        fontSize: SizeConstants.xlarge,
                        fontColor: fontColor,
                        celsiusImageSize: SizeConstants.large,
                      ),
                      ConditionWidget(
                        separatorDistance: SizeConstants.tiny,
                        iconWidth: SizeConstants.xxxlarge,
                        fontSize: SizeConstants.middle,
                        iconPath: hourlyForecastItem.iconPath,
                        conditionText: hourlyForecastItem.condition,
                        fontColor: fontColor,
                      ),
                      Text(
                        hourlyForecastItem.time.substring(11),
                        style: TextStyle(
                          color: fontColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
