import 'package:flutter/material.dart';
import 'package:flutter_clean_blox_template/shared/shared.dart';

class CheckboxSelectionTabPage extends StatefulWidget {
  const CheckboxSelectionTabPage({super.key});

  @override
  State<CheckboxSelectionTabPage> createState() =>
      _CheckboxSelectionTabPageState();
}

class _CheckboxSelectionTabPageState extends State<CheckboxSelectionTabPage> {
  late final BasicSelectionController _basicCheckboxAndroidActiveController;
  late final BasicSelectionController _basicCheckboxAndroidInactiveController;
  late final BasicSelectionController
  _basicCheckboxAndroidCustomColorController;
  late final BasicSelectionController _basicCheckboxIosActiveController;
  late final BasicSelectionController _basicCheckboxIosInactiveController;
  late final BasicSelectionController _basicCheckboxIosCustomColorController;
  late final BasicSelectionController _basicCheckboxAdaptiveActiveController;
  late final BasicSelectionController _basicCheckboxAdaptiveInactiveController;
  late final BasicSelectionController
  _basicCheckboxAdaptiveCustomColorController;

  @override
  void initState() {
    super.initState();

    // Android Controllers
    _basicCheckboxAndroidActiveController = BasicSelectionController(
      initialValue: true,
    );
    _basicCheckboxAndroidInactiveController = BasicSelectionController();
    _basicCheckboxAndroidCustomColorController = BasicSelectionController(
      initialValue: true,
    );

    // iOS Controllers
    _basicCheckboxIosActiveController = BasicSelectionController(
      initialValue: true,
    );
    _basicCheckboxIosInactiveController = BasicSelectionController();
    _basicCheckboxIosCustomColorController = BasicSelectionController(
      initialValue: true,
    );

    // Adaptive Controllers
    _basicCheckboxAdaptiveActiveController = BasicSelectionController(
      initialValue: true,
    );
    _basicCheckboxAdaptiveInactiveController = BasicSelectionController();
    _basicCheckboxAdaptiveCustomColorController = BasicSelectionController(
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
              "Basic Checkbox - Android",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            24.paddingVertical,
            // basic checkbox Android
            BasicCheckbox.android(
              controller: _basicCheckboxAndroidActiveController,
              onChanged: (value) {},
              label: "Basic Checkbox Android Active",
            ),
            16.paddingVertical,
            // basic checkbox Android disabled
            BasicCheckbox.android(
              controller: _basicCheckboxAndroidInactiveController,
              onChanged: (value) {},
              state: BasicSelectionState.disabled,
              label: "Basic Checkbox Android Inactive",
            ),
            16.paddingVertical,
            BasicCheckbox.android(
              controller: _basicCheckboxAndroidCustomColorController,
              onChanged: (value) {},
              checkColor: Colors.white,
              backgroundColor: Colors.blue,
              label: "Basic Checkbox Android With Color",
            ),
            16.paddingVertical,
            Divider(),
            24.paddingVertical,
            Text(
              "Basic Checkbox - iOS",

              style: Theme.of(context).textTheme.headlineSmall,
            ),
            24.paddingVertical,
            // basic switch iOS
            BasicCheckbox.ios(
              controller: _basicCheckboxIosActiveController,
              onChanged: (value) {},
              label: "Basic Checkbox iOS Active",
            ),
            16.paddingVertical,
            // basic switch iOS disabled
            BasicCheckbox.ios(
              controller: _basicCheckboxIosInactiveController,
              onChanged: (value) {},
              state: BasicSelectionState.disabled,
              label: "Basic Checkbox iOS Inactive",
            ),
            16.paddingVertical,
            BasicCheckbox.ios(
              controller: _basicCheckboxIosCustomColorController,
              onChanged: (value) {},
              checkColor: Colors.white,
              backgroundColor: Colors.blue,
              label: "Basic Checkbox IOS With Color",
            ),
            16.paddingVertical,
            Divider(),
            24.paddingVertical,
            Text(
              "Basic Checkbox - Adaptive",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            24.paddingVertical,
            // basic switch Native
            BasicCheckbox.adaptive(
              controller: _basicCheckboxAdaptiveActiveController,
              onChanged: (value) {},
              label: "Basic Checkbox Adaptive Active",
            ),
            16.paddingVertical,
            // basic switch Adaptive disabled
            BasicCheckbox.adaptive(
              controller: _basicCheckboxAdaptiveInactiveController,
              onChanged: (value) {},
              state: BasicSelectionState.disabled,
              label: "Basic Checkbox Adaptive Inactive",
            ),
            16.paddingVertical,
            BasicCheckbox.adaptive(
              controller: _basicCheckboxAdaptiveCustomColorController,
              onChanged: (value) {},
              checkColor: Colors.white,
              backgroundColor: Colors.blue,
              label: "Basic Checkbox Adaptive With Color",
            ),
            24.paddingVertical,
          ],
        ),
      ),
    );
  }
}
