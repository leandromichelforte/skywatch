import 'package:get_it/get_it.dart';
import 'package:skywatch/features/weather_info/data/datasources/datasources.dart';
import 'package:skywatch/features/weather_info/data/repositories/repositories.dart';
import 'package:skywatch/features/weather_info/domain/repositories/repositories.dart';
import 'package:skywatch/features/weather_info/domain/usecases/usecases.dart';

sealed class CurrentPositionInject {
  static void inject(GetIt getIt) {
    getIt.registerFactory<GetCurrentPositionDatasource>(
      () => GetCurrentPositionDatasourceImpl(),
    );
    getIt.registerFactory<GetCurrentPositionRepository>(
      () => GetCurrentPositionRepositoryImpl(
        getCurrentPositionDatasource: getIt.get<GetCurrentPositionDatasource>(),
      ),
    );
    getIt.registerFactory<GetCurrentPositionUsecase>(
      () => GetCurrentPositionUsecaseImpl(
        getCurrentPositionRepository: getIt.get<GetCurrentPositionRepository>(),
      ),
    );
  }
}
