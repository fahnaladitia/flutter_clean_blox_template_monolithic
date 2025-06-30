part of '../widgets.dart';

enum BasicTextFieldState { active, disabled }

extension BasicTextFieldStateExt on BasicTextFieldState {
  bool get isActive => this == BasicTextFieldState.active;
  bool get isDisabled => this == BasicTextFieldState.disabled;

  String get message {
    switch (this) {
      case BasicTextFieldState.active:
        return 'Active';
      case BasicTextFieldState.disabled:
        return 'Disabled';
    }
  }
}

extension BasicTextFieldStateExtList on List<BasicTextFieldState> {
  bool get isActive => every((state) => state.isActive);
  bool get isDisabled => any((state) => state.isDisabled);

  String get message {
    if (isActive) return 'Active';
    if (isDisabled) return 'Disabled';
    return '';
  }
}
