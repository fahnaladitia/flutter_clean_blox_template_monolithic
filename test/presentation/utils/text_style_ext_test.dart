import 'package:flutter/material.dart';
import 'package:flutter_clean_blox_template/presentation/utils/text_style_ext.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TextStyleExtension', () {
    const baseStyle = TextStyle();

    test('bold should apply FontWeight.bold', () {
      final style = baseStyle.bold;
      expect(style.fontWeight, FontWeight.bold);
    });

    test('italic should apply FontStyle.italic', () {
      final style = baseStyle.italic;
      expect(style.fontStyle, FontStyle.italic);
    });

    test('underline should apply TextDecoration.underline', () {
      final style = baseStyle.underline;
      expect(style.decoration, TextDecoration.underline);
    });

    test('lineThrough should apply TextDecoration.lineThrough', () {
      final style = baseStyle.lineThrough;
      expect(style.decoration, TextDecoration.lineThrough);
    });

    test('size should apply given font size', () {
      final style = baseStyle.size(18);
      expect(style.fontSize, 18);
    });

    test('color should apply given color', () {
      final testColor = Colors.red;
      final style = baseStyle.copyWith(color: testColor);
      expect(style.color, testColor);
    });

    test('chaining works correctly', () {
      final testColor = Colors.blue;

      final style = baseStyle.bold.italic.underline
          .size(20)
          .copyWith(color: testColor);

      expect(style.fontWeight, FontWeight.bold);
      expect(style.fontStyle, FontStyle.italic);
      expect(style.decoration, TextDecoration.underline);
      expect(style.fontSize, 20);
      expect(style.color, testColor);
    });
  });
}
