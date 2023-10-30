import 'package:skywatch/core/constants/strings/strings.dart';

final class ApiException implements Exception {
  const ApiException({
    required this.error,
  });
  final String message =
      SharedStringsConstants.somethingWentWrongFethingYourVideosTryAgain;
  final Object error;
}
