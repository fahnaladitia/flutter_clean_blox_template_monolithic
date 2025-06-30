part of 'observers.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

class SimpleBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    AppLogger.info(
      'Transition: ${transition.currentState} -> ${transition.nextState} | Event: ${transition.event}',
    );
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    AppLogger.info(
      'Change: ${change.currentState} -> ${change.nextState} | Bloc: ${bloc.runtimeType}',
    );
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    AppLogger.info('Event: $event | Bloc: ${bloc.runtimeType}');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    AppLogger.error(
      'Error: $error | Bloc: ${bloc.runtimeType} | StackTrace: $stackTrace',
    );
    super.onError(bloc, error, stackTrace);
  }
}
