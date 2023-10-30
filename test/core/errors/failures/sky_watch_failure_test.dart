import 'package:flutter_test/flutter_test.dart';
import 'package:skywatch/core/errors/failures/failures.dart';

void main() {
  test('SkyWatchFailure equality test', () {
    const failure1 = SkyWatchFailure(message: 'Something went wrong');
    const failure2 = SkyWatchFailure(message: 'Something went wrong');
    const failure3 = SkyWatchFailure(message: 'Another error message');

    expect(failure1, failure2);
    expect(failure1.hashCode, failure2.hashCode);
    expect(failure1, isNot(equals(failure3)));
  });
}
