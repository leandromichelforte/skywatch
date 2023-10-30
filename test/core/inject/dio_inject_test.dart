import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:skywatch/core/get_it_instance/get_it_instance.dart';
import 'package:skywatch/core/inject/dio_inject.dart';

void main() {
  setUp(() {
    DioInject.inject();
  });

  tearDown(() {
    getIt.reset();
  });

  test('should register Dio', () {
    final dio = getIt<Dio>();
    expect(dio, isA<Dio>());
  });
}
