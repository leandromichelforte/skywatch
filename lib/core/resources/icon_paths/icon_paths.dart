sealed class IconPaths {
  static const String _basePath = 'assets/icons';
  static const String _pathsEnd = '_icon.png';
  static const String weatherBasePath = '$_basePath/weather';
  static const String humidityIconPath = '$weatherBasePath/humidity$_pathsEnd';
  static const String locationIconPath = '$weatherBasePath/location$_pathsEnd';
  static const String windIconPath = '$weatherBasePath/wind$_pathsEnd';
  static const String celsiusIconPath = '$weatherBasePath/celsius$_pathsEnd';
  static const String thermometerIconPath =
      '$weatherBasePath/thermometer$_pathsEnd';
  static const String maxTempIconPath = '$weatherBasePath/max_temp$_pathsEnd';
  static const String minTempIconPath = '$weatherBasePath/min_temp$_pathsEnd';
  static const String rainIconPath = '$weatherBasePath/rain$_pathsEnd';
  static const String snowIconPath = '$weatherBasePath/snow$_pathsEnd';
  static const String logo = '$_basePath/logo.png';
  static const String emptyIconPath = '$_basePath/empty$_pathsEnd';
}
