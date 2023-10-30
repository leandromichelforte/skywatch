import 'package:flutter_test/flutter_test.dart';
import 'package:skywatch/core/errors/exceptions/exceptions.dart';

void main() {
  test('GenericException should have the correct message', () {
    const exception =
        GenericException(message: 'An error occurred', error: 'Some error');

    expect(exception.message, 'An error occurred');
  });

  test('GenericException should store the error object', () {
    const errorObject = 'Some error';
    const exception =
        GenericException(message: 'An error occurred', error: errorObject);

    expect(exception.error, errorObject);
  });
}
