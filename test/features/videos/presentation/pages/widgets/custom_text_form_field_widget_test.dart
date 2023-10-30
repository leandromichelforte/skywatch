import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:skywatch/core/constants/constants.dart';
import 'package:skywatch/features/videos/presentation/pages/widgets/custom_text_form_field_widget.dart';

void main() {
  late TextEditingController textController;
  late Widget customTextFormFieldWidget;
  late GlobalKey<FormState> formKey;

  setUp(() {
    formKey = GlobalKey<FormState>();
    textController = TextEditingController();
    customTextFormFieldWidget = MaterialApp(
      home: Scaffold(
        body: Form(
          key: formKey,
          child: CustomTextFormFieldWidget(
            controller: textController,
            hintText: 'Test Hint',
          ),
        ),
      ),
    );
  });

  testWidgets('CustomTextFormFieldWidget should render',
      (WidgetTester tester) async {
    await tester.pumpWidget(customTextFormFieldWidget);
    expect(find.byType(CustomTextFormFieldWidget), findsOneWidget);
  });

  testWidgets('CustomTextFormFieldWidget should validate empty input',
      (WidgetTester tester) async {
    await tester.pumpWidget(customTextFormFieldWidget);
    await tester.enterText(find.byType(TextField), '');

    final validateMessageFinder =
        find.text(VideosStringsConstants.requiredField);

    formKey.currentState?.validate();
    await tester.pumpAndSettle();
    expect(validateMessageFinder, findsOneWidget);
  });

  testWidgets(
      'CustomTextFormFieldWidget should not validate when input is not empty',
      (WidgetTester tester) async {
    await tester.pumpWidget(customTextFormFieldWidget);
    await tester.enterText(find.byType(TextField), 'Non-empty text');

    final validateMessageFinder =
        find.text(VideosStringsConstants.requiredField);
    expect(validateMessageFinder, findsNothing);
  });

  tearDown(() {
    textController.dispose();
  });
}
