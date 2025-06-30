import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_blox_template/shared/shared.dart'; // Ganti jika path ekstensimu berbeda

void main() {
  group('EdgeInsetsExtension', () {
    const testValue = 16.0;

    test('edgeAll returns EdgeInsets.all()', () {
      expect(testValue.edgeAll, EdgeInsets.all(testValue));
    });

    test('edgeY returns EdgeInsets.symmetric(vertical)', () {
      expect(testValue.edgeVertical, EdgeInsets.symmetric(vertical: testValue));
    });

    test('edgeX returns EdgeInsets.symmetric(horizontal)', () {
      expect(
        testValue.edgeHorizontal,
        EdgeInsets.symmetric(horizontal: testValue),
      );
    });

    test('edgeLeft returns EdgeInsets.only(left)', () {
      expect(testValue.edgeLeft, EdgeInsets.only(left: testValue));
    });

    test('edgeRight returns EdgeInsets.only(right)', () {
      expect(testValue.edgeRight, EdgeInsets.only(right: testValue));
    });

    test('edgeTop returns EdgeInsets.only(top)', () {
      expect(testValue.edgeTop, EdgeInsets.only(top: testValue));
    });

    test('edgeBottom returns EdgeInsets.only(bottom)', () {
      expect(testValue.edgeBottom, EdgeInsets.only(bottom: testValue));
    });

    test('edgeLTRB returns EdgeInsets.fromLTRB()', () {
      expect(
        testValue.edgeLTRB,
        EdgeInsets.fromLTRB(testValue, testValue, testValue, testValue),
      );
    });
  });
}
