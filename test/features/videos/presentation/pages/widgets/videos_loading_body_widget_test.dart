import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:skywatch/core/shared_widgets/shared_widgets.dart';
import 'package:skywatch/features/videos/presentation/pages/widgets/videos_loading_body_widget.dart';

void main() {
  testWidgets('should find one shimmerwidget and 8 containers', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(body: VideosLoadingBodyWidget()),
    ));

    expect(find.byType(ShimmerWidget), findsOneWidget);
    expect(find.byType(Container), findsNWidgets(8));
  });
}
