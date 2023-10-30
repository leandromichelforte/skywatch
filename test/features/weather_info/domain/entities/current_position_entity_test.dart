import 'package:flutter_test/flutter_test.dart';
import 'package:skywatch/features/weather_info/domain/entities/current_position_entity.dart';

void main() {
  test('should have correct properties, be equal, and have the same hashCode',
      () {
    const latitude = '12.345';
    const longitude = '67.890';

    const entity1 =
        CurrentPositionEntity(latitude: latitude, longitude: longitude);
    const entity2 =
        CurrentPositionEntity(latitude: '12.345', longitude: '67.890');

    expect(entity1, entity2);
    expect(entity1.hashCode, entity2.hashCode);

    expect(entity1.latitude, latitude);
    expect(entity1.longitude, longitude);
  });
}
