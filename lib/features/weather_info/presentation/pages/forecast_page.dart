import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skywatch/core/constants/constants.dart';
import 'package:skywatch/features/weather_info/presentation/cubits/cubits.dart';
import 'package:skywatch/features/weather_info/presentation/widgets/hourly_forecast_list_widget.dart';

class ForecastPage extends StatefulWidget {
  const ForecastPage({super.key});

  @override
  State<ForecastPage> createState() => _ForecastPageState();
}

class _ForecastPageState extends State<ForecastPage> {
  late final WeatherCubit _weatherCubit;
  late final Color backgroundColor;
  late final Color fontColor;

  @override
  void initState() {
    super.initState();
    _weatherCubit = context.read<WeatherCubit>();
    if ((_weatherCubit.state as WeatherLoadedState).weatherEntity.isDay) {
      backgroundColor = ColorsConstants.dayColor;
      fontColor = Colors.black;
    } else {
      backgroundColor = ColorsConstants.nightColor;
      fontColor = Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      bloc: _weatherCubit,
      builder: (context, state) {
        if (state is WeatherLoadedState) {
          return Scaffold(
            backgroundColor: backgroundColor,
            appBar: AppBar(
              leading: BackButton(
                color: fontColor,
              ),
              backgroundColor: backgroundColor,
              centerTitle: true,
              title: Text(
                WeatherStringsConstants.forecast,
                style: TextStyle(color: fontColor),
              ),
            ),
            body: HourlyForecastListWidget(
              weatherEntity: state.weatherEntity,
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
