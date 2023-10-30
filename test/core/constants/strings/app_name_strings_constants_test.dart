import 'package:flutter_test/flutter_test.dart';
import 'package:skywatch/core/constants/strings/app_name_strings_constants.dart';

void main() {
  test('should return SkyWatch', () {
    expect(AppNameStringsConstants.appName, 'SkyWatch');
  });
}
