import 'package:flutter/material.dart';
import 'package:flutter_clean_blox_template/shared/shared.dart';

class SwitchSelectionTabPage extends StatefulWidget {
  const SwitchSelectionTabPage({super.key});

  @override
  State<SwitchSelectionTabPage> createState() => _SwitchSelectionTabPageState();
}

class _SwitchSelectionTabPageState extends State<SwitchSelectionTabPage> {
  late final BasicSelectionController _basicSwitchAndroidActiveController;
  late final BasicSelectionController _basicSwitchAndroidInactiveController;
  late final BasicSelectionController _basicSwitchAndroidCustomIconsController;
  late final BasicSelectionController _basicSwitchIosActiveController;
  late final BasicSelectionController _basicSwitchIosInactiveController;
  late final BasicSelectionController _basicSwitchIosCustomIconsController;
  late final BasicSelectionController _basicSwitchAdaptiveActiveController;
  late final BasicSelectionController _basicSwitchAdaptiveInactiveController;
  late final BasicSelectionController _basicSwitchAdaptiveCustomIconsController;
  late final BasicSelectionController _basicSwitchIconActiveController;
  late final BasicSelectionController _basicSwitchIconInactiveController;
  late final BasicSelectionController _basicSwitchIconCustomIconsController;

  @override
  void initState() {
    super.initState();

    // Android Controllers
    _basicSwitchAndroidActiveController = BasicSelectionController(
      initialValue: true,
    );
    _basicSwitchAndroidInactiveController = BasicSelectionController();
    _basicSwitchAndroidCustomIconsController = BasicSelectionController(
      initialValue: true,
    );

    // iOS Controllers
    _basicSwitchIosActiveController = BasicSelectionController();
    _basicSwitchIosInactiveController = BasicSelectionController();
    _basicSwitchIosCustomIconsController = BasicSelectionController(
      initialValue: true,
    );

    // Adaptive Controllers
    _basicSwitchAdaptiveActiveController = BasicSelectionController(
      initialValue: true,
    );
    _basicSwitchAdaptiveInactiveController = BasicSelectionController();
    _basicSwitchAdaptiveCustomIconsController = BasicSelectionController(
      initialValue: true,
    );

    // Icon Controllers
    _basicSwitchIconActiveController = BasicSelectionController(
      initialValue: true,
    );
    _basicSwitchIconInactiveController = BasicSelectionController();
    _basicSwitchIconCustomIconsController = BasicSelectionController(
      initialValue: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
      body: Padding(
        padding: 24.edgeHorizontal,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            24.paddingVertical,
            Text(
              "Basic Switch - Android",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            24.paddingVertical,
            // basic switch Android
            BasicSwitch.android(
              controller: _basicSwitchAndroidActiveController,
              onChanged: (value) {},
              label: "Basic Switch Android Active",
            ),
            16.paddingVertical,
            // basic switch Android disabled
            BasicSwitch.android(
              controller: _basicSwitchAndroidInactiveController,
              state: BasicSelectionState.disabled,
              onChanged: (value) {},
              label: "Basic Switch Android Inactive",
            ),
            16.paddingVertical,
            BasicSwitch.android(
              onChanged: (value) {},
              controller: _basicSwitchAndroidCustomIconsController,
              activeIcon: const Icon(Icons.light_mode),
              inactiveIcon: const Icon(Icons.dark_mode),
              activeColor: Colors.yellow,
              inactiveColor: Colors.blue,
              activeBackgroundColor: Colors.yellow,
              inactiveBackgroundColor: Colors.black,
              label: "Basic Switch Android With Icons",
            ),
            16.paddingVertical,
            Divider(),
            24.paddingVertical,
            Text(
              "Basic Switch - iOS",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            24.paddingVertical,
            // basic switch iOS
            BasicSwitch.ios(
              controller: _basicSwitchIosActiveController,
              onChanged: (value) {},
              label: "Basic Switch iOS Active",
            ),
            16.paddingVertical,
            // basic switch iOS disabled
            BasicSwitch.ios(
              controller: _basicSwitchIosInactiveController,
              state: BasicSelectionState.disabled,
              onChanged: (value) {},
              label: "Basic Switch iOS Inactive",
            ),
            16.paddingVertical,
            BasicSwitch.ios(
              controller: _basicSwitchIosCustomIconsController,
              onChanged: (value) {},
              activeIcon: const Icon(Icons.light_mode),
              inactiveIcon: const Icon(Icons.dark_mode),
              activeColor: Colors.yellow,
              inactiveColor: Colors.blue,
              activeBackgroundColor: Colors.yellow,
              inactiveBackgroundColor: Colors.black,
              label: "Basic Switch IOS With Icons",
            ),
            16.paddingVertical,
            Divider(),
            24.paddingVertical,
            Text(
              "Basic Switch - Adaptive",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            24.paddingVertical,
            // basic switch Native
            BasicSwitch.adaptive(
              controller: _basicSwitchAdaptiveActiveController,
              onChanged: (value) {},
              label: "Basic Switch Adaptive Active",
            ),
            16.paddingVertical,
            // basic switch Adaptive disabled
            BasicSwitch.adaptive(
              controller: _basicSwitchAdaptiveInactiveController,
              state: BasicSelectionState.disabled,
              onChanged: (value) {},

              label: "Basic Switch Adaptive Inactive",
            ),
            16.paddingVertical,
            BasicSwitch.adaptive(
              controller: _basicSwitchAdaptiveCustomIconsController,
              onChanged: (value) {},
              activeIcon: const Icon(Icons.light_mode),
              inactiveIcon: const Icon(Icons.dark_mode),
              activeColor: Colors.yellow,
              inactiveColor: Colors.blue,
              activeBackgroundColor: Colors.yellow,
              inactiveBackgroundColor: Colors.black,
              label: "Basic Switch Adaptive With Icons",
            ),
            16.paddingVertical,
            Divider(),
            24.paddingVertical,
            Text(
              "Basic Switch - Icon",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            24.paddingVertical,
            // basic switch Icon
            BasicSwitch.icon(
              controller: _basicSwitchIconActiveController,
              onChanged: (value) {},
              activeIcon: const Icon(Icons.favorite),
              label: "Basic Switch Icon Active",
            ),
            16.paddingVertical,
            // basic switch Icon disabled
            BasicSwitch.icon(
              controller: _basicSwitchIconInactiveController,
              state: BasicSelectionState.disabled,
              onChanged: (value) {},
              activeIcon: const Icon(Icons.favorite),
              label: "Basic Switch Icon Inactive",
            ),
            16.paddingVertical,
            // basic switch Icon custom colors
            BasicSwitch.icon(
              controller: _basicSwitchIconCustomIconsController,
              onChanged: (value) {},
              label: "Basic Switch Icon Custom Colors",
              activeIcon: const Icon(Icons.light_mode),
              inactiveIcon: const Icon(Icons.dark_mode),
              activeColor: Colors.yellow,
              inactiveColor: Colors.blue,
              activeBackgroundColor: Colors.white,
              inactiveBackgroundColor: Colors.black,
              elevation: 10.0,
            ),
            24.paddingVertical,
          ],
        ),
      ),
    );
  }
}
