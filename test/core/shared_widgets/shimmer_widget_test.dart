import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shimmer/shimmer.dart';
import 'package:skywatch/core/shared_widgets/shimmer_widget.dart';

void main() {
  testWidgets('should display ShimmerWidget with child',
      (WidgetTester tester) async {
    const text = 'Shimmer Text';
    const child = Text(text);

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: ShimmerWidget(child: child),
        ),
      ),
    );
    expect(find.text(text), findsOneWidget);
    expect(find.byType(Shimmer), findsOneWidget);
  });
}
