import 'package:flutter/widgets.dart';
import 'package:flutter_clean_blox_template/presentation/utils/edge_insets_ext.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('EdgeInsetsExtension', () {
    const value = 8.0;

    test('edgeAll should return EdgeInsets.all(value)', () {
      expect(value.edgeAll, EdgeInsets.all(value));
    });

    test('edgeX should return EdgeInsets.symmetric(horizontal: value)', () {
      expect(value.edgeX, EdgeInsets.symmetric(horizontal: value));
    });

    test('edgeY should return EdgeInsets.symmetric(vertical: value)', () {
      expect(value.edgeY, EdgeInsets.symmetric(vertical: value));
    });

    test('edgeLeft should return EdgeInsets.only(left: value)', () {
      expect(value.edgeLeft, EdgeInsets.only(left: value));
    });

    test('edgeRight should return EdgeInsets.only(right: value)', () {
      expect(value.edgeRight, EdgeInsets.only(right: value));
    });

    test('edgeTop should return EdgeInsets.only(top: value)', () {
      expect(value.edgeTop, EdgeInsets.only(top: value));
    });

    test('edgeBottom should return EdgeInsets.only(bottom: value)', () {
      expect(value.edgeBottom, EdgeInsets.only(bottom: value));
    });

    test(
      'edgeLTRB should return EdgeInsets.fromLTRB(value, value, value, value)',
      () {
        expect(value.edgeLTRB, EdgeInsets.fromLTRB(value, value, value, value));
      },
    );
  });
}
