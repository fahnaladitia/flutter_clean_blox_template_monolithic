part of '../widgets.dart';

enum BasicSelectionState { active, disabled }

extension BasicSelectionStateExtension on BasicSelectionState {
  bool get isActive => this == BasicSelectionState.active;
  bool get isDisabled => this == BasicSelectionState.disabled;
}
