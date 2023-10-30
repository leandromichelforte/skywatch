import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skywatch/core/get_it_instance/get_it_instance.dart';
import 'package:skywatch/core/inject/inject.dart';
import 'package:skywatch/core/routes/named_routes.dart';
import 'package:skywatch/core/routes/routes.dart';
import 'package:skywatch/features/videos/presentation/cubits/cubits.dart';
import 'package:skywatch/features/weather_info/presentation/cubits/cubits.dart';
import 'package:skywatch/home_page.dart';

class BuildContextMock extends Mock implements BuildContext {}

void main() {
  setUpAll(() {
    Inject.init();
  });

  tearDownAll(() {
    getIt.reset();
  });

  final context = BuildContextMock();
  test('should return all routes with correct mappings', () {
    final routes = Routes.allRoutes(context);

    expect(routes[NamedRoutes.home]!(context), isA<HomePage>());
    expect(routes[NamedRoutes.weather]!(context),
        isA<BlocProvider<WeatherCubit>>());
    expect(routes[NamedRoutes.forecast]!(context),
        isA<BlocProvider<WeatherCubit>>());
    expect(
        routes[NamedRoutes.videos]!(context), isA<BlocProvider<VideoCubit>>());
    expect(routes[NamedRoutes.uploadVideo]!(context),
        isA<BlocProvider<VideoCubit>>());
  });

  test('should return all routes with correct keys', () {
    final routes = Routes.allRoutes(context);

    expect(
        routes.keys,
        containsAll([
          NamedRoutes.home,
          NamedRoutes.weather,
          NamedRoutes.forecast,
          NamedRoutes.videos,
          NamedRoutes.uploadVideo
        ]));
  });
}
