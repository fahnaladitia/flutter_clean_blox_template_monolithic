part of 'navigation.dart';

enum AppPageTranstionType { fade, native, none }

class AppPage extends GoRoute {
  AppPage({
    required super.path,
    required Widget Function(BuildContext, GoRouterState) builder,
    AppPageTranstionType transitionType = AppPageTranstionType.native,
  }) : super(
         pageBuilder: (context, state) {
           if (transitionType == AppPageTranstionType.native) {
             return MaterialPage(
               key: state.pageKey,
               child: builder(context, state),
             );
           }
           return CustomTransitionPage(
             key: state.pageKey,
             child: builder(context, state),
             transitionDuration: transitionType == AppPageTranstionType.none
                 ? Duration.zero
                 : const Duration(milliseconds: 300),
             reverseTransitionDuration:
                 transitionType == AppPageTranstionType.none
                 ? Duration.zero
                 : const Duration(milliseconds: 300),
             transitionsBuilder:
                 (context, animation, secondaryAnimation, child) {
                   if (transitionType == AppPageTranstionType.fade) {
                     return FadeTransition(opacity: animation, child: child);
                   }

                   return child;
                 },
           );
         },
       );
}
