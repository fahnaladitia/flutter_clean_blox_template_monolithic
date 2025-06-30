part of 'extensions.dart';

extension GoRouterExtension on BuildContext {
  //  Navigation methods
  void push<T>({required String to, Object? extra}) {
    GoRouter.of(this).push<T>(to, extra: extra);
  }

  void go({required String to, Object? extra}) {
    GoRouter.of(this).go(to, extra: extra);
  }

  void pop<T extends Object?>([T? result]) {
    Navigator.of(this).pop<T>(result);
  }
}
