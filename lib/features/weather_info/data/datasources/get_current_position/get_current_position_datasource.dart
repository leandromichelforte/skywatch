import 'package:skywatch/features/weather_info/data/models/models.dart';

abstract interface class GetCurrentPositionDatasource {
  Future<CurrentPositionModel> call();
}
