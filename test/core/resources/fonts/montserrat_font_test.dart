import 'package:flutter_test/flutter_test.dart';
import 'package:skywatch/core/resources/fonts/montserrat_font.dart';

void main() {
  test('should return Montserrat as the family name', () {
    expect(MontserratFont.familyName, 'Montserrat');
  });
}
