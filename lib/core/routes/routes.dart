import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skywatch/core/get_it_instance/get_it_instance.dart';
import 'package:skywatch/core/routes/named_routes.dart';
import 'package:skywatch/features/videos/presentation/cubits/cubits.dart';
import 'package:skywatch/features/videos/presentation/pages/pages.dart';
import 'package:skywatch/features/weather_info/presentation/cubits/cubits.dart';
import 'package:skywatch/features/weather_info/presentation/pages/pages.dart';
import 'package:skywatch/home_page.dart';

sealed class Routes {
  static Map<String, Widget Function(BuildContext)> allRoutes(
    BuildContext context,
  ) =>
      {
        NamedRoutes.home: (context) => const HomePage(),
        NamedRoutes.weather: (context) => BlocProvider<WeatherCubit>.value(
              value: getIt.get<WeatherCubit>(),
              child: const WeatherPage(),
            ),
        NamedRoutes.forecast: (context) => BlocProvider<WeatherCubit>.value(
              value: getIt.get<WeatherCubit>(),
              child: const ForecastPage(),
            ),
        NamedRoutes.videos: (context) => BlocProvider<VideoCubit>.value(
              value: getIt.get<VideoCubit>(),
              child: const VideoPage(),
            ),
        NamedRoutes.uploadVideo: (context) => BlocProvider<VideoCubit>.value(
              value: getIt.get<VideoCubit>(),
              child: const UploadVideoPage(),
            ),
      };
}
