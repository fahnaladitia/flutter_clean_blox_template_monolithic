import 'package:flutter/material.dart';
import 'package:flutter_clean_blox_template/presentation/widgets/basic_pull_refresh.dart';

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

  const BasicScaffold({
    super.key,
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
        key: key,

        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        appBar: appBar,
        body: SafeArea(
          bottom: false,
          child: isSingleChildScrollView
              ? onRefresh != null
                    ? BasicPullRefresh(
                        onRefresh: onRefresh!,
                        child: CustomScrollView(
                          controller: scrollController,
                          physics: const AlwaysScrollableScrollPhysics(
                            parent: BouncingScrollPhysics(),
                          ),
                          slivers: [SliverToBoxAdapter(child: body)],
                        ),
                      )
                    : SingleChildScrollView(
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
