part of 'widgets.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

class BasicScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? bottomNavigationBar;
  final bool? resizeToAvoidBottomInset;
  final bool isSingleChildScrollView;
  final Future<void> Function()? onRefresh;
  final Function()? onTap;
  final Widget? floatingActionButton;
  final ScrollController? scrollController;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final Key? scrollViewKey;
  final bool? shrinkWrapCustomScrollView;

  const BasicScaffold({
    super.key,
    this.scrollViewKey,
    this.shrinkWrapCustomScrollView,
    this.appBar,
    required this.body,
    this.bottomNavigationBar,
    this.resizeToAvoidBottomInset,
    this.isSingleChildScrollView = true,
    this.onRefresh,
    this.onTap,
    this.floatingActionButton,
    this.scrollController,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          onTap ??
          () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
      child: Scaffold(
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        appBar: appBar,
        body: SafeArea(
          bottom: false,
          child: isSingleChildScrollView
              ? onRefresh != null
                    ? BasicPullRefresh(
                        onRefresh: onRefresh!,
                        child: CustomScrollView(
                          key: scrollViewKey,
                          shrinkWrap: shrinkWrapCustomScrollView ?? false,
                          controller: scrollController,
                          physics: const AlwaysScrollableScrollPhysics(
                            parent: BouncingScrollPhysics(),
                          ),
                          slivers: [SliverToBoxAdapter(child: body)],
                        ),
                      )
                    : SingleChildScrollView(
                        key: scrollViewKey,
                        controller: scrollController,
                        physics: const BouncingScrollPhysics(),
                        keyboardDismissBehavior: keyboardDismissBehavior,
                        child: body,
                      )
              : body,
        ),
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
      ),
    );
  }
}
