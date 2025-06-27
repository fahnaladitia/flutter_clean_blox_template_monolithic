import 'package:flutter/material.dart';
import 'package:flutter_clean_blox_template/presentation/utils/app_text_style.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppTextStyle', () {
    testWidgets('labelInputText returns correct style', (tester) async {
      final widget = Text('Label Input', style: AppTextStyle.labelInputText);

      await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));

      final textWidget = tester.widget<Text>(find.text('Label Input'));
      final style = textWidget.style!;

      expect(style.fontSize, 13);
      expect(style.fontWeight, FontWeight.w400);
      expect(style.color, const Color(0xFFB9B9B9));
    });

    testWidgets('textBold returns correct style', (tester) async {
      final widget = Text('Bold Text', style: AppTextStyle.textBold);

      await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));

      final style = tester.widget<Text>(find.text('Bold Text')).style!;
      expect(style.fontSize, 16);
      expect(style.fontWeight, FontWeight.w700);
      expect(style.color, const Color(0xFF757575));
    });

    testWidgets('buttonTextBold returns white text', (tester) async {
      final widget = Text('Button', style: AppTextStyle.buttonTextBold);

      await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));

      final style = tester.widget<Text>(find.text('Button')).style!;
      expect(style.fontSize, 15);
      expect(style.fontWeight, FontWeight.w600);
      expect(style.color, Colors.white);
    });

    // Tambahkan test untuk style lain jika perlu
  });
}
