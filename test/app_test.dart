import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:skywatch/app.dart';
import 'package:skywatch/core/constants/colors/colors_constants.dart';
import 'package:skywatch/core/constants/strings/strings.dart';
import 'package:skywatch/core/routes/named_routes.dart';

void main() {
  testWidgets('should check the theme and routes correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    final appMaterial = find.byType(MaterialApp);
    expect(appMaterial, findsOneWidget);
    MaterialApp? app;
    await tester.runAsync(() async {
      app = tester.widget(appMaterial) as MaterialApp;
    });

    expect(app!.debugShowCheckedModeBanner, false);
    expect(app?.title, AppNameStringsConstants.appName);

    if (SchedulerBinding.instance.platformDispatcher.platformBrightness ==
        Brightness.dark) {
      expect(app?.theme?.colorScheme.primary, ColorsConstants.orange);
      expect(app?.theme?.colorScheme.onPrimary, Colors.white);
      expect(app?.theme?.colorScheme.background, Colors.grey.shade900);
      expect(app?.theme?.colorScheme.surface, Colors.grey.shade900);
      expect(app?.theme?.colorScheme.surfaceTint, ColorsConstants.primaryGrey);
    } else {
      expect(app?.theme?.colorScheme.primary, ColorsConstants.orange);
      expect(app?.theme?.colorScheme.onPrimary, Colors.white);
    }
    expect(app?.initialRoute, NamedRoutes.home);
  });
}
