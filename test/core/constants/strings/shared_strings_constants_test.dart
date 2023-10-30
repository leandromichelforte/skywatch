import 'package:flutter_test/flutter_test.dart';
import 'package:skywatch/core/constants/strings/shared_strings_constants.dart';

void main() {
  test('should return Try again', () {
    expect(SharedStringsConstants.tryAgain, 'Try again');
  });

  test('should return Something went wrong', () {
    expect(SharedStringsConstants.somethingWentWrong, 'Something went wrong');
  });

  test('should return correct combined string', () {
    expect(SharedStringsConstants.somethingWentWrongFethingYourVideosTryAgain,
        'Something went wrong fetching your videos. Try again');
  });

  test('should return An error has occurred. Try again', () {
    expect(SharedStringsConstants.occurredAnErrorTryAgain,
        'An error has occurred. Try again');
  });

  test('should return No internet. Check your connection and try again', () {
    expect(SharedStringsConstants.checkYourConnectionAndTryAgain,
        'No internet. Check your connection and try again');
  });
}
