import 'package:flutter_test/flutter_test.dart';
import 'package:skywatch/core/constants/size/size_constants.dart';

void main() {
  test('should return tiny', () {
    expect(SizeConstants.tiny, 4);
  });

  test('should return small', () {
    expect(SizeConstants.small, 8);
  });

  test('should return middle', () {
    expect(SizeConstants.middle, 12);
  });

  test('should return medium', () {
    expect(SizeConstants.medium, 16);
  });

  test('should return large', () {
    expect(SizeConstants.large, 20);
  });

  test('should return xlarge', () {
    expect(SizeConstants.xlarge, 24);
  });

  test('should return xxlarge', () {
    expect(SizeConstants.xxlarge, 32);
  });

  test('should return xxxlarge', () {
    expect(SizeConstants.xxxlarge, 48);
  });

  test('should return big', () {
    expect(SizeConstants.big, 128);
  });

  test('should return xbig', () {
    expect(SizeConstants.xbig, 256);
  });

  test('should return xxbig', () {
    expect(SizeConstants.xxbig, 300);
  });

  test('should return xxxbig', () {
    expect(SizeConstants.xxxbig, 400);
  });
}
