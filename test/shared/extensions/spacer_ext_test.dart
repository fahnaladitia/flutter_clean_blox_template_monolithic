import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_clean_blox_template/shared/shared.dart'; // ganti sesuai path

void main() {
  group('SpacerExtension', () {
    testWidgets('paddingY returns SizedBox with correct height', (
      tester,
    ) async {
      const height = 10.0;
      final widget = height.paddingVertical;

      await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));

      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
      expect(sizedBox.height, equals(height));
      expect(sizedBox.width, isNull);
    });

    testWidgets('paddingX returns SizedBox with correct width', (tester) async {
      const width = 20.0;
      final widget = width.paddingHorizontal;

      await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));

      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
      expect(sizedBox.width, equals(width));
      expect(sizedBox.height, isNull);
    });

    testWidgets('paddingXY returns SizedBox with equal width and height', (
      tester,
    ) async {
      const size = 12.0;
      final widget = size.paddingAll;

      await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));

      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
      expect(sizedBox.width, equals(size));
      expect(sizedBox.height, equals(size));
    });
  });
}
