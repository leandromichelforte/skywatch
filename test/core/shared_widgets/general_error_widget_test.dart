import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:skywatch/core/constants/constants.dart';
import 'package:skywatch/core/shared_widgets/shared_widgets.dart';

void main() {
  testWidgets('should display GeneralErrorWidget with correct content',
      (WidgetTester tester) async {
    const message = 'This is an error message';
    bool tryAgainPressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: GeneralErrorWidget(
            message: message,
            tryAgainCallback: () {
              tryAgainPressed = true;
            },
          ),
        ),
      ),
    );
    expect(
        find.text(SharedStringsConstants.somethingWentWrong), findsOneWidget);
    expect(find.text(message), findsOneWidget);
    expect(find.text(SharedStringsConstants.tryAgain), findsOneWidget);
    expect(find.byType(PrimaryButtonWidget), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
    await tester.tap(find.text(SharedStringsConstants.tryAgain));
    await tester.pump();

    expect(tryAgainPressed, true);
  });
}
