part of '../widgets.dart';

enum BasicButtonEventState { active, disabled, loading }

extension BasicButtonEventStateExtension on BasicButtonEventState {
  bool get isActive => this == BasicButtonEventState.active;
  bool get isDisabled => this == BasicButtonEventState.disabled;
  bool get isLoading => this == BasicButtonEventState.loading;

  String get name {
    switch (this) {
      case BasicButtonEventState.active:
        return 'Active';
      case BasicButtonEventState.disabled:
        return 'Disabled';
      case BasicButtonEventState.loading:
        return 'Loading';
    }
  }

  int get value {
    switch (this) {
      case BasicButtonEventState.active:
        return 0;
      case BasicButtonEventState.disabled:
        return 1;
      case BasicButtonEventState.loading:
        return 2;
    }
  }
}
