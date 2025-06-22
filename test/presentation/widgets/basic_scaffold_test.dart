import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_clean_blox_template/presentation/widgets/basic_scaffold.dart';

void main() {
  testWidgets('renders BasicScaffold with simple body', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: BasicScaffold(body: Text('Hello World'))),
    );

    expect(find.text('Hello World'), findsOneWidget);
    expect(find.byType(SingleChildScrollView), findsOneWidget);
  });

  testWidgets('calls onRefresh when pulled', (tester) async {
    var refreshed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: BasicScaffold(
          onRefresh: () async {
            refreshed = true;
          },
          body: Column(
            children: List.generate(
              50,
              (i) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Item $i'),
              ),
            ),
          ),
        ),
      ),
    );

    await tester.pump(); // Build widget
    await tester.fling(find.byType(BasicScaffold), const Offset(0, 300), 1000);
    await tester.pump(); // Start the refresh indicator animation
    await tester.pump(
      const Duration(seconds: 1),
    ); // Allow onRefresh to complete

    expect(refreshed, isTrue); // ✅ Test must pass
  });

  testWidgets('renders BasicScaffold with appBar', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BasicScaffold(
          appBar: AppBar(title: const Text('Test AppBar')),
          body: const Text('Hello World'),
        ),
      ),
    );

    expect(find.text('Test AppBar'), findsOneWidget);
    expect(find.text('Hello World'), findsOneWidget);
  });

  testWidgets('taps outside to unfocus', (tester) async {
    final focusNode = FocusNode();
    await tester.pumpWidget(
      MaterialApp(
        home: BasicScaffold(
          body: Column(
            children: [
              TextField(focusNode: focusNode),
              const Text('Tap anywhere'),
            ],
          ),
        ),
      ),
    );

    focusNode.requestFocus();
    await tester.pump();

    expect(focusNode.hasFocus, isTrue);

    await tester.tap(find.text('Tap anywhere'));
    await tester.pump();

    expect(focusNode.hasFocus, isFalse);
  });
}
