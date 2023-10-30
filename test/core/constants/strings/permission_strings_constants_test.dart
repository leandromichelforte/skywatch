import 'package:flutter_test/flutter_test.dart';
import 'package:skywatch/core/constants/strings/strings.dart';

void main() {
  test('should return Permission not granted', () {
    expect(PermissionStringsConstants.permissionNotGranted,
        'Permission not granted');
  });
}
