import 'package:flutter/material.dart';
import 'package:flutter_clean_blox_template/presentation/utils/spacer_ext.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SpacerExtension', () {
    test('paddingY should return a SizedBox with height', () {
      const value = 16.0;
      final widget = value.paddingY;

      expect(widget, isA<SizedBox>());
      expect(widget.height, value);
      expect(widget.width, isNull);
    });

    test('paddingX should return a SizedBox with width', () {
      const value = 12.0;
      final widget = value.paddingX;

      expect(widget, isA<SizedBox>());
      expect(widget.width, value);
      expect(widget.height, isNull);
    });

    test('paddingXY should return a square SizedBox', () {
      const value = 20.0;
      final widget = value.paddingXY;

      expect(widget, isA<SizedBox>());
      expect(widget.width, value);
      expect(widget.height, value);
    });

    test('should support int as num type', () {
      final widgetY = 8.paddingY;
      final widgetX = 8.paddingX;
      final widgetXY = 8.paddingXY;

      expect(widgetY.height, 8);
      expect(widgetX.width, 8);
      expect(widgetXY.height, 8);
      expect(widgetXY.width, 8);
    });
  });
}
