import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_clean_blox_template/shared/shared.dart';

void main() {
  group('BasicSwitch Tests', () {
    testWidgets('Android Active', (tester) async {
      final controller = BasicSelectionController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BasicSwitch.android(controller: controller, label: 'Android'),
          ),
        ),
      );
      await tester.tap(find.byType(Switch));
      await tester.pump();
      expect(controller.state, isTrue);
    });

    testWidgets('Android Disabled', (tester) async {
      final controller = BasicSelectionController();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BasicSwitch.android(
              controller: controller,
              state: BasicSelectionState.disabled,
              label: 'Android Disabled',
            ),
          ),
        ),
      );
      await tester.tap(find.byType(Switch));
      await tester.pump();
      expect(controller.state, isFalse);
    });

    testWidgets('iOS Active', (tester) async {
      final controller = BasicSelectionController();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: BasicSwitch.ios(controller: controller)),
        ),
      );
      await tester.tap(find.byType(CupertinoSwitch));
      await tester.pump();
      expect(controller.state, isTrue);
    });

    testWidgets('iOS Disabled', (tester) async {
      final controller = BasicSelectionController();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BasicSwitch.ios(
              controller: controller,
              state: BasicSelectionState.disabled,
            ),
          ),
        ),
      );
      await tester.tap(find.byType(CupertinoSwitch));
      await tester.pump();
      expect(controller.state, isFalse);
    });

    testWidgets('Adaptive Active', (tester) async {
      final controller = BasicSelectionController();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: BasicSwitch.adaptive(controller: controller)),
        ),
      );
      await tester.tap(find.byType(Switch));
      await tester.pump();
      expect(controller.state, isTrue);
    });

    testWidgets('Adaptive Disabled', (tester) async {
      final controller = BasicSelectionController();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BasicSwitch.adaptive(
              controller: controller,
              state: BasicSelectionState.disabled,
            ),
          ),
        ),
      );
      await tester.tap(find.byType(Switch));
      await tester.pump();
      expect(controller.state, isFalse);
    });

    testWidgets('Icon Type: active icon displayed when true', (tester) async {
      final controller = BasicSelectionController(initialValue: true);
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BasicSwitch.icon(
              controller: controller,
              activeIcon: const Icon(Icons.check),
              inactiveIcon: const Icon(Icons.close),
            ),
          ),
        ),
      );
      expect(find.byIcon(Icons.check), findsOneWidget);
      expect(find.byIcon(Icons.close), findsNothing);
    });

    testWidgets('Icon Type: inactive icon displayed when false', (
      tester,
    ) async {
      final controller = BasicSelectionController();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BasicSwitch.icon(
              controller: controller,
              activeIcon: const Icon(Icons.check),
              inactiveIcon: const Icon(Icons.close),
            ),
          ),
        ),
      );
      expect(find.byIcon(Icons.close), findsOneWidget);
      expect(find.byIcon(Icons.check), findsNothing);
    });

    testWidgets('Icon Type: toggles value when active', (tester) async {
      final controller = BasicSelectionController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BasicSwitch.icon(
              controller: controller,
              activeIcon: const Icon(Icons.check),
              inactiveIcon: const Icon(Icons.close),
            ),
          ),
        ),
      );
      await tester.tap(find.byType(IconButton));
      await tester.pump();
      expect(controller.state, isTrue);
    });

    testWidgets('Icon Type: does not toggle when disabled', (tester) async {
      final controller = BasicSelectionController();
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BasicSwitch.icon(
              controller: controller,
              state: BasicSelectionState.disabled,
              activeIcon: const Icon(Icons.check),
              inactiveIcon: const Icon(Icons.close),
            ),
          ),
        ),
      );
      await tester.tap(find.byType(IconButton));
      await tester.pump();
      expect(controller.state, isFalse);
    });

    testWidgets('Icon Type: custom icon colors and backgrounds', (
      tester,
    ) async {
      final controller = BasicSelectionController(initialValue: true);
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BasicSwitch.icon(
              controller: controller,
              activeIcon: const Icon(Icons.check),
              inactiveIcon: const Icon(Icons.close),
              activeColor: Colors.red,
              inactiveColor: Colors.blue,
              activeBackgroundColor: Colors.green,
              inactiveBackgroundColor: Colors.yellow,
            ),
          ),
        ),
      );

      final iconButton = tester.widget<IconButton>(find.byType(IconButton));
      expect(iconButton.color, Colors.red);
    });
  });
}
