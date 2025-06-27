import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_clean_blox_template/presentation/widgets/basic_pull_refresh.dart';

void main() {
  testWidgets('calls onRefresh when pulled', (WidgetTester tester) async {
    bool refreshed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BasicPullRefresh(
            onRefresh: () async {
              refreshed = true;
            },
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: List.generate(
                20,
                (index) => ListTile(title: Text('Item $index')),
              ),
            ),
          ),
        ),
      ),
    );

    // Scroll ke atas agar bisa dipull
    final gesture = await tester.startGesture(const Offset(0, 100));
    await gesture.moveBy(const Offset(0, 300)); // drag down
    await gesture.up();

    await tester.pump(); // start the animation
    await tester.pump(const Duration(seconds: 1)); // simulate refresh complete

    expect(refreshed, isTrue);
  });

  testWidgets('displays the child', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BasicPullRefresh(
            onRefresh: () async {},
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [ListTile(title: Text('Item 1'))],
            ),
          ),
        ),
      ),
    );

    expect(find.text('Item 1'), findsOneWidget);
    expect(find.byType(RefreshIndicator), findsOneWidget);
  });
}
