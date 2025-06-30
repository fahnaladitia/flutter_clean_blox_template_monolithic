import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_clean_blox_template/shared/shared.dart'; // Ganti dengan path sesuai modul kamu

void main() {
  testWidgets('renders BasicPullRefresh and triggers onRefresh', (
    WidgetTester tester,
  ) async {
    bool refreshed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BasicPullRefresh(
            onRefresh: () async {
              refreshed = true;
            },
            child: ListView.builder(
              key: const Key('pull_refresh_list'),
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: 100,
              itemBuilder: (_, i) => ListTile(title: Text('Item $i')),
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
}
