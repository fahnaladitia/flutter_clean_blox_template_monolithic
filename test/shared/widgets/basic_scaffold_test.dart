import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_clean_blox_template/shared/shared.dart'; // Ganti jika perlu sesuai struktur proyekmu

void main() {
  testWidgets('renders BasicScaffold with minimal config', (tester) async {
    await tester.pumpWidget(
      MaterialApp(home: BasicScaffold(body: const Text('Hello Body'))),
    );

    expect(find.text('Hello Body'), findsOneWidget);
  });

  testWidgets('renders BasicScaffold with AppBar and BottomNavigationBar', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BasicScaffold(
          appBar: AppBar(title: const Text('AppBar Title')),
          body: const Text('With Navigation'),
          bottomNavigationBar: const BottomAppBar(
            child: SizedBox(height: 50, child: Text('BottomNav')),
          ),
        ),
      ),
    );

    expect(find.text('AppBar Title'), findsOneWidget);
    expect(find.text('With Navigation'), findsOneWidget);
    expect(find.text('BottomNav'), findsOneWidget);
  });

  testWidgets('triggers onTap to unfocus when tapping outside', (tester) async {
    final focusNode = FocusNode();

    await tester.pumpWidget(
      MaterialApp(
        home: BasicScaffold(
          body: Column(
            children: [
              const SizedBox(height: 100, width: double.infinity),
              TextField(focusNode: focusNode),
            ],
          ),
        ),
      ),
    );

    focusNode.requestFocus();
    await tester.pumpAndSettle();
    expect(focusNode.hasFocus, isTrue);

    await tester.tapAt(const Offset(5, 5)); // tap on empty area
    await tester.pumpAndSettle();
    expect(focusNode.hasFocus, isFalse);
  });

  testWidgets('renders with pull-to-refresh and triggers onRefresh', (
    tester,
  ) async {
    bool refreshed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: BasicScaffold(
          shrinkWrapCustomScrollView: true,
          scrollViewKey: const Key("pull_refresh_list"),
          onRefresh: () async {
            refreshed = true;
          },
          body: Column(
            children: List.generate(
              100,
              (i) => ListTile(title: Text('Item $i')),
            ),
          ),
        ),
      ),
    );

    // Pastikan ListView ditemukan
    expect(find.byKey(ValueKey("pull_refresh_list")), findsOneWidget);

    // Simulasikan drag
    await tester.drag(
      find.byKey(ValueKey("pull_refresh_list")),
      Offset(0, 300),
    );
    await tester.pump(); // Start animation
    await tester.pump(const Duration(seconds: 1)); // Finish animation

    // Verifikasi
    expect(refreshed, isTrue);
  });

  testWidgets('respects isSingleChildScrollView = false', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BasicScaffold(
          isSingleChildScrollView: false,
          body: const Center(child: Text('Non-Scroll View')),
        ),
      ),
    );

    expect(find.text('Non-Scroll View'), findsOneWidget);
  });

  testWidgets('shows floatingActionButton if provided', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: BasicScaffold(
          body: const Text('FAB test'),
          floatingActionButton: FloatingActionButton(
            key: const ValueKey('fab'),
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );

    expect(find.byKey(const ValueKey('fab')), findsOneWidget);
  });
}
