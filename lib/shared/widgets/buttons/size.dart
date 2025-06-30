part of '../widgets.dart';

enum BasicButtonSize { small, medium, large }

extension BasicButtonSizeExtension on BasicButtonSize {
  double get height {
    switch (this) {
      case BasicButtonSize.small:
        return 42.0;
      case BasicButtonSize.medium:
        return 48.0;
      case BasicButtonSize.large:
        return 54.0;
    }
  }

  double get width {
    switch (this) {
      case BasicButtonSize.small:
        return 64.0;
      case BasicButtonSize.medium:
        return 72.0;
      case BasicButtonSize.large:
        return 80.0;
    }
  }
}
