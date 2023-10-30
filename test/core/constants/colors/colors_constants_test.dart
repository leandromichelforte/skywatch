import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:skywatch/core/constants/colors/colors_constants.dart';

void main() {
  test('should return dayColor', () {
    expect(ColorsConstants.dayColor, const Color.fromARGB(255, 133, 200, 255));
  });

  test('should return dayColorLight', () {
    expect(ColorsConstants.dayColorLight,
        const Color.fromARGB(255, 206, 233, 255));
  });

  test('should return nightColor', () {
    expect(ColorsConstants.nightColor, const Color(0xFF154c79));
  });

  test('should return nightColorLight', () {
    expect(ColorsConstants.nightColorLight,
        const Color.fromARGB(255, 84, 121, 152));
  });

  test('should return primaryGrey', () {
    expect(ColorsConstants.primaryGrey, const Color(0xFF5b5b5b));
  });

  test('should return orange', () {
    expect(ColorsConstants.orange, const Color(0xFFef5842));
  });
}
