import 'package:flutter_test/flutter_test.dart';
import 'package:skywatch/core/constants/strings/strings.dart';
import 'package:skywatch/core/errors/exceptions/connection_exception.dart';

void main() {
  test('should have the correct message', () {
    const connectionException =
        ConnectionException(error: 'Some connection error');
    expect(connectionException.message,
        SharedStringsConstants.checkYourConnectionAndTryAgain);
  });

  test('should store the error object', () {
    const errorObject = 'Some connection error';
    const connectionException = ConnectionException(error: errorObject);
    expect(connectionException.error, errorObject);
  });
}
