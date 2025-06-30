import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_clean_blox_template/shared/shared.dart';

void main() {
  group('BasicCheckbox - Android', () {
    testWidgets('toggles when active', (tester) async {
      final controller = BasicSelectionController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: BasicCheckbox.android(controller: controller)),
        ),
      );

      await tester.tap(find.byType(Checkbox));
      await tester.pumpAndSettle();
      expect(controller.state, isTrue);
    });

    testWidgets('does not toggle when disabled', (tester) async {
      final controller = BasicSelectionController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BasicCheckbox.android(
              controller: controller,
              state: BasicSelectionState.disabled,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(Checkbox));
      await tester.pump();
      expect(controller.state, isFalse);
    });
  });

  group('BasicCheckbox - iOS', () {
    testWidgets('toggles when active', (tester) async {
      final controller = BasicSelectionController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: BasicCheckbox.ios(controller: controller)),
        ),
      );

      await tester.tap(find.byType(CupertinoCheckbox));
      await tester.pumpAndSettle();
      expect(controller.state, isTrue);
    });

    testWidgets('does not toggle when disabled', (tester) async {
      final controller = BasicSelectionController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BasicCheckbox.ios(
              controller: controller,
              state: BasicSelectionState.disabled,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(CupertinoCheckbox));
      await tester.pump();
      expect(controller.state, isFalse);
    });
  });

  group('BasicCheckbox - Adaptive', () {
    testWidgets('toggles when active', (tester) async {
      final controller = BasicSelectionController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: BasicCheckbox.adaptive(controller: controller)),
        ),
      );

      await tester.tap(find.byType(Checkbox));
      await tester.pump();
      expect(controller.state, isTrue);
    });

    testWidgets('does not toggle when disabled', (tester) async {
      final controller = BasicSelectionController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BasicCheckbox.adaptive(
              controller: controller,
              state: BasicSelectionState.disabled,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(Checkbox));
      await tester.pump();
      expect(controller.state, isFalse);
    });
  });

  group('BasicCheckbox - Customizations', () {
    testWidgets('shows label and applies custom colors', (tester) async {
      final controller = BasicSelectionController();
      const labelText = 'Custom Checkbox';
      const checkColor = Colors.pink;
      const backgroundColor = Colors.black;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BasicCheckbox.android(
              controller: controller,
              label: labelText,
              checkColor: checkColor,
              backgroundColor: backgroundColor,
            ),
          ),
        ),
      );

      expect(find.text(labelText), findsOneWidget);

      final checkbox = tester.widget<Checkbox>(find.byType(Checkbox));
      expect(checkbox.checkColor, equals(checkColor));
      expect(checkbox.activeColor, equals(backgroundColor));
    });
  });
}
