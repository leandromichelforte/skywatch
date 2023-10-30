import 'package:skywatch/core/get_it_instance/get_it_instance.dart';
import 'package:skywatch/core/inject/current_position_inject.dart';
import 'package:skywatch/core/inject/dio_inject.dart';
import 'package:skywatch/core/inject/video_inject.dart';
import 'package:skywatch/core/inject/weather_inject.dart';

sealed class Inject {
  static Future<void> init() async {
    DioInject.inject();
    CurrentPositionInject.inject(getIt);
    WeatherInject.inject(getIt);
    VideoInject.inject(getIt);
  }
}
