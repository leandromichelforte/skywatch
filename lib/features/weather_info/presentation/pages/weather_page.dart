import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skywatch/core/constants/constants.dart';
import 'package:skywatch/core/routes/named_routes.dart';
import 'package:skywatch/features/weather_info/presentation/cubits/cubits.dart';
import 'package:skywatch/features/weather_info/presentation/widgets/weather_loaded_body_widget.dart';
import 'package:skywatch/core/shared_widgets/shared_widgets.dart';
import 'package:skywatch/features/weather_info/presentation/widgets/weather_loading_body_widget.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  late final WeatherCubit _weatherCubit;
  Color? backgroundColor;
  Color? fontColor;

  @override
  void initState() {
    super.initState();
    _weatherCubit = context.read<WeatherCubit>()..getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherState>(
      bloc: _weatherCubit,
      listener: (context, state) {
        if (state is CurrentPositionLoadedState &&
            state is! WeatherLoadedState) {
          _weatherCubit.getWeather();
        }
        if (state is WeatherLoadedState) {
          if (state.weatherEntity.isDay) {
            backgroundColor = ColorsConstants.dayColor;
            fontColor = Colors.black;
          } else {
            backgroundColor = ColorsConstants.nightColor;
            fontColor = Colors.white;
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            leading: BackButton(
              color: fontColor,
            ),
            backgroundColor: backgroundColor,
            centerTitle: true,
            title: Text(
              WeatherStringsConstants.weather,
              style: TextStyle(color: fontColor),
            ),
          ),
          bottomNavigationBar: BlocBuilder<WeatherCubit, WeatherState>(
            bloc: _weatherCubit,
            builder: (context, state) {
              if (state is WeatherLoadedState) {
                return Padding(
                  padding: const EdgeInsets.all(SizeConstants.xlarge),
                  child: PrimaryButtonWidget(
                      text: WeatherStringsConstants.forecast,
                      onPressed: () =>
                          Navigator.pushNamed(context, NamedRoutes.forecast)),
                );
              }
              return const SizedBox.shrink();
            },
          ),
          body: BlocBuilder(
              bloc: _weatherCubit,
              builder: (context, state) {
                if (state is WeatherLoadedState) {
                  return WeatherLoadedBodyWidget(
                    weatherEntity: state.weatherEntity,
                  );
                }
                if (state is CurrentPositionErrorState) {
                  return GeneralErrorWidget(
                    message: state.message,
                    tryAgainCallback: _weatherCubit.getCurrentPosition,
                  );
                }
                if (state is WeatherErrorState) {
                  return GeneralErrorWidget(
                    message: state.message,
                    tryAgainCallback: _weatherCubit.getWeather,
                  );
                }
                return const WeatherLoadingBodyWidget();
              }),
        );
      },
    );
  }
}
