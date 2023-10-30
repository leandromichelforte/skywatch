import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:skywatch/core/routes/named_routes.dart';
import 'package:skywatch/core/shared_widgets/shared_widgets.dart';
import 'package:skywatch/home_page.dart';

import 'core/core_mocktail.dart';

void main() {
  late NavigatorObserver navigatorObserver;
  setUpAll(() {
    navigatorObserver = MockNavigatorObserver();
    registerFallbackValue(MockRoute());
  });
  testWidgets(
      'should find 2 primary buttons and verify if push routes correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        navigatorObservers: [
          navigatorObserver,
        ],
        routes: {
          NamedRoutes.videos: (_) => const SizedBox.shrink(),
        },
        home: const HomePage(),
      ),
    );
    expect(find.byType(Image), findsOneWidget);
    final videosButton = find.widgetWithText(PrimaryButtonWidget, 'Videos');
    final weatherButton =
        find.widgetWithText(PrimaryButtonWidget, 'View Weather');

    expect(videosButton, findsOneWidget);
    expect(weatherButton, findsOneWidget);
    await tester.tap(videosButton);
    await tester.pumpAndSettle();
    verify(
      () => navigatorObserver.didPush(
        any(),
        any(),
      ),
    ).called(2);
  });

  testWidgets('should push weather page correclty', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        navigatorObservers: [
          navigatorObserver,
        ],
        routes: {
          NamedRoutes.weather: (_) => const SizedBox.shrink(),
        },
        home: const HomePage(),
      ),
    );
    final weatherButton =
        find.widgetWithText(PrimaryButtonWidget, 'View Weather');
    await tester.tap(weatherButton);
    await tester.pumpAndSettle();
    verify(
      () => navigatorObserver.didPush(
        any(),
        any(),
      ),
    ).called(2);
  });
}
