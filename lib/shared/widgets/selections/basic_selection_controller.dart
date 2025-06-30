part of '../widgets.dart';

class BasicSelectionController extends Cubit<bool> {
  BasicSelectionController({bool initialValue = false}) : super(initialValue);

  void toggle() {
    emit(!state);
  }

  void select(bool value) {
    if (state == value) return;
    emit(value);
  }
}
