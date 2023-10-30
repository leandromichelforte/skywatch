import 'package:skywatch/core/constants/strings/strings.dart';

final class ConnectionException implements Exception {
  const ConnectionException({
    required this.error,
  });
  final String message = SharedStringsConstants.checkYourConnectionAndTryAgain;
  final Object error;
}
