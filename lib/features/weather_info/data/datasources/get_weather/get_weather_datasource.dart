import 'package:skywatch/features/weather_info/data/models/models.dart';

abstract interface class GetWeatherDatasource {
  Future<WeatherModel> call({
    required CurrentPositionModel currentPositionModel,
  });
}
