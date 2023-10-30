import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:skywatch/core/shared_widgets/shared_widgets.dart';

void main() {
  testWidgets('should display PrimaryButtonWidget with the correct text',
      (WidgetTester tester) async {
    const buttonText = 'Primary Button';
    bool buttonPressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PrimaryButtonWidget(
            text: buttonText,
            onPressed: () {
              buttonPressed = true;
            },
          ),
        ),
      ),
    );
    expect(find.text(buttonText), findsOneWidget);
    await tester.tap(find.text(buttonText));
    await tester.pump();
    expect(buttonPressed, true);
  });
}
