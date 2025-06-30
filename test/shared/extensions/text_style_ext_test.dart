import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_clean_blox_template/shared/shared.dart'; // Ganti sesuai path file extension kamu

void main() {
  group('TextStyleExtension', () {
    test('bold should return a TextStyle with FontWeight.bold', () {
      final original = const TextStyle();
      final result = original.bold;
      expect(result.fontWeight, FontWeight.bold);
    });

    test('italic should return a TextStyle with FontStyle.italic', () {
      final original = const TextStyle();
      final result = original.italic;
      expect(result.fontStyle, FontStyle.italic);
    });

    test(
      'underline should return a TextStyle with TextDecoration.underline',
      () {
        final original = const TextStyle();
        final result = original.underline;
        expect(result.decoration, TextDecoration.underline);
      },
    );

    test(
      'lineThrough should return a TextStyle with TextDecoration.lineThrough',
      () {
        final original = const TextStyle();
        final result = original.lineThrough;
        expect(result.decoration, TextDecoration.lineThrough);
      },
    );

    test('size should return a TextStyle with given font size', () {
      final original = const TextStyle();
      final result = original.size(18);
      expect(result.fontSize, 18);
    });

    test('color should return a TextStyle with given color', () {
      final original = const TextStyle();
      final result = original.copyWith(color: Colors.blue);
      expect(result.color, Colors.blue);
    });

    test('chained styling works correctly', () {
      final original = const TextStyle();
      final result = original.bold.italic.underline
          .size(20)
          .copyWith(color: Colors.green);

      expect(result.fontWeight, FontWeight.bold);
      expect(result.fontStyle, FontStyle.italic);
      expect(result.decoration, TextDecoration.underline);
      expect(result.fontSize, 20);
      expect(result.color, Colors.green);
    });
  });
}
