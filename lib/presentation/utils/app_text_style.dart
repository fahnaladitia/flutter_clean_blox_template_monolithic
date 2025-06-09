import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

class AppTextStyle {
  static TextStyle? get labelInputText => GoogleFonts.roboto(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: const Color(0xFFB9B9B9),
  );

  static TextStyle? get hintInputText => GoogleFonts.roboto(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: const Color(0xFFB9B9B9),
  );

  static TextStyle? get text => GoogleFonts.roboto(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: const Color(0xFF757575),
  );

  static TextStyle? get textBold => GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: const Color(0xFF757575),
  );

  static TextStyle? get displayBold => GoogleFonts.roboto(
    fontSize: 21,
    fontWeight: FontWeight.w600,
    color: const Color(0xFF121212),
  );

  static TextStyle? get display => GoogleFonts.roboto(
    fontSize: 21,
    fontWeight: FontWeight.w400,
    color: const Color(0xFF121212),
  );

  static TextStyle? get buttonTextBold => GoogleFonts.roboto(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static TextStyle? get buttonText => GoogleFonts.roboto(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static TextStyle? get appBarTitle => GoogleFonts.roboto(
    fontSize: 17,
    fontWeight: FontWeight.w500,
    color: const Color(0xFF121212),
  );
}
