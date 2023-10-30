import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:skywatch/features/weather_info/data/datasources/datasources.dart';
import 'package:skywatch/features/weather_info/data/repositories/repositories.dart';
import 'package:skywatch/features/weather_info/domain/repositories/repositories.dart';
import 'package:skywatch/features/weather_info/domain/usecases/usecases.dart';
import 'package:skywatch/features/weather_info/presentation/cubits/cubits.dart';

sealed class WeatherInject {
  static void inject(GetIt getIt) {
    getIt.registerFactory<GetWeatherDatasource>(
      () => GetWeatherDatasourceImpl(dio: getIt.get<Dio>()),
    );
    getIt.registerFactory<GetWeatherRepository>(
      () => GetWeatherRepositoryImpl(
        getWeatherDatasource: getIt.get<GetWeatherDatasource>(),
      ),
    );
    getIt.registerFactory<GetWeatherUsecase>(
      () => GetWeatherUsecaseImpl(
        getWeatherRepository: getIt.get<GetWeatherRepository>(),
      ),
    );
    getIt.registerLazySingleton<WeatherCubit>(
      () => WeatherCubit(
        getCurrentPositionUsecase: getIt.get<GetCurrentPositionUsecase>(),
        getWeatherUsecase: getIt.get<GetWeatherUsecase>(),
      ),
    );
  }
}
