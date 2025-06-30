import 'package:flutter_clean_blox_template/features/home/presentation/pages/preview/selections_tabs/checkbox_selection_tab_page.dart';
import 'package:flutter_clean_blox_template/features/home/presentation/pages/preview/selections_tabs/switch_selection_tab_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_blox_template/shared/shared.dart';

class SelectionsPreviewPage extends StatefulWidget {
  const SelectionsPreviewPage({super.key});

  @override
  State<SelectionsPreviewPage> createState() => _SelectionsPreviewPageState();
}

class _SelectionsPreviewPageState extends State<SelectionsPreviewPage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BasicScaffold(
      isSingleChildScrollView: false,
      appBar: AppBar(
        title: Text(context.l10n.selections),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: "Switches", icon: Icon(Icons.toggle_on)),
            Tab(text: "Checkboxes", icon: Icon(Icons.check_box)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [SwitchSelectionTabPage(), CheckboxSelectionTabPage()],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
