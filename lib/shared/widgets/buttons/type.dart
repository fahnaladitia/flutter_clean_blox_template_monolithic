part of '../widgets.dart';

enum BasicButtonType { elevated, filled, outlined, text }

extension BasicButtonTypeExtension on BasicButtonType {
  String get name {
    switch (this) {
      case BasicButtonType.elevated:
        return 'Elevated';
      case BasicButtonType.filled:
        return 'Filled';
      case BasicButtonType.outlined:
        return 'Outlined';
      case BasicButtonType.text:
        return 'Text';
    }
  }

  int get value {
    switch (this) {
      case BasicButtonType.elevated:
        return 0;
      case BasicButtonType.filled:
        return 1;
      case BasicButtonType.outlined:
        return 2;
      case BasicButtonType.text:
        return 3;
    }
  }
}
