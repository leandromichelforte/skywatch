import 'package:permission_handler/permission_handler.dart';
import 'package:skywatch/core/constants/strings/strings.dart';
import 'package:skywatch/core/errors/exceptions/exceptions.dart';
import 'package:skywatch/features/weather_info/data/datasources/datasources.dart';
import 'package:geolocator/geolocator.dart';
import 'package:skywatch/features/weather_info/data/models/models.dart';

final class GetCurrentPositionDatasourceImpl
    implements GetCurrentPositionDatasource {
  @override
  Future<CurrentPositionModel> call() async {
    try {
      await Permission.locationWhenInUse.request();
      final geolocatorPosition = await Geolocator.getCurrentPosition();
      return CurrentPositionModel.fromGeolocatorPosition(
        geolocatorPosition: geolocatorPosition,
      );
    } on PermissionDeniedException catch (exception) {
      throw PermissionDeniedException(
        exception.message ?? PermissionStringsConstants.permissionNotGranted,
      );
    } catch (exception) {
      throw GenericException(
        message: SharedStringsConstants.occurredAnErrorTryAgain,
        error: exception,
      );
    }
  }
}
