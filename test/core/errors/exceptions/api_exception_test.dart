import 'package:flutter_test/flutter_test.dart';
import 'package:skywatch/core/constants/strings/strings.dart';
import 'package:skywatch/core/errors/exceptions/exceptions.dart';

void main() {
  test('should have the correct message', () {
    const apiException = ApiException(error: 'Some error message');
    expect(apiException.message,
        SharedStringsConstants.somethingWentWrongFethingYourVideosTryAgain);
  });

  test('should store the error object', () {
    const errorObject = 'Some error message';
    const apiException = ApiException(error: errorObject);
    expect(apiException.error, errorObject);
  });
}
