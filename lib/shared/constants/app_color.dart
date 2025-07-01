part of 'constants.dart';

class AppColor {
  AppColor._();
  static Color get primaryLight => const Color.fromARGB(255, 0, 102, 255);
  static Color get primaryDark => const Color.fromARGB(212, 3, 96, 99);
  static Color get onPrimaryLight => const Color.fromARGB(255, 255, 255, 255);
  static Color get onPrimaryDark => const Color.fromARGB(255, 246, 254, 255);
  static Color get surfaceLight => const Color(0xFFFFFFFF);
  static Color get surfaceDark => const Color(0xFF121212);
  static Color get onSurfaceLight => const Color(0xFF000000);
  static Color get onSurfaceDark => const Color(0xFFFFFFFF);
  static Color get onSurfaceVariantLight => const Color(0xFFBDBDBD);
  static Color get onSurfaceVariantDark => const Color(0xFF757575);
}
