import 'package:flutter/material.dart';
import 'package:flutter_clean_blox_template/presentation/utils/app_text_style.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

enum BasicButtonState { active, disabled, loading }

class BasicButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color fillColor;
  final Color textColor;
  final Color? sideColor;
  final double? width;
  final Widget? icon;
  final TextStyle? textStyle;
  final BasicButtonState state;

  const BasicButton._({
    super.key,
    required this.text,
    this.onPressed,
    required this.fillColor,
    required this.textColor,
    this.sideColor,
    this.width,
    this.icon,
    this.textStyle,
    this.state = BasicButtonState.active,
  });

  /// Primary button preset
  const BasicButton.primary({
    Key? key,
    required String text,
    void Function()? onPressed,
    double? width,
    Widget? icon,
    TextStyle? textStyle,
    BasicButtonState state = BasicButtonState.active,
    Color? fillColor,
  }) : this._(
         key: key,
         text: text,
         onPressed: onPressed,
         fillColor: fillColor ?? const Color(0xFF1FA0C9),
         textColor: Colors.white,
         width: width,
         icon: icon,
         textStyle: textStyle,
         state: state,
       );

  /// Secondary button preset
  const BasicButton.secondary({
    Key? key,
    required String text,
    void Function()? onPressed,
    double? width,
    Widget? icon,
    TextStyle? textStyle,
    BasicButtonState state = BasicButtonState.active,
  }) : this._(
         key: key,
         text: text,
         onPressed: onPressed,
         fillColor: Colors.white,
         textColor: const Color(0xFF1FA0C9),
         sideColor: const Color(0xFF1FA0C9),
         width: width,
         icon: icon,
         textStyle: textStyle,
         state: state,
       );

  bool get _isEnabled => state == BasicButtonState.active;
  bool get _isLoading => state == BasicButtonState.loading;

  @override
  Widget build(BuildContext context) {
    final style = FilledButton.styleFrom(
      backgroundColor: fillColor,
      foregroundColor: textColor,
      textStyle: textStyle ?? AppTextStyle.buttonText,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        side: sideColor != null
            ? BorderSide(color: sideColor!)
            : BorderSide.none,
      ),
      elevation: 0,
      alignment: Alignment.center,
    );

    final child = _isLoading
        ? const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: Colors.white,
            ),
          )
        : Text(text);

    return SizedBox(
      width: width,
      height: 43,
      child: icon != null && !_isLoading
          ? FilledButton.icon(
              onPressed: _isEnabled ? onPressed : null,
              style: style,
              icon: icon!,
              label: child,
            )
          : FilledButton(
              onPressed: _isEnabled ? onPressed : null,
              style: style,
              child: child,
            ),
    );
  }
}
