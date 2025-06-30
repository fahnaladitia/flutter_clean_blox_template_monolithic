import 'package:flutter/material.dart';
import 'package:flutter_clean_blox_template/shared/shared.dart';

class ButtonsPreviewPage extends StatelessWidget {
  const ButtonsPreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
      appBar: AppBar(title: Text(context.l10n.buttons), centerTitle: true),
      body: Padding(
        padding: 8.edgeHorizontal,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            24.paddingVertical,
            Text(
              context.l10n.buttonsPreviewDescription,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            24.paddingVertical,
            // divider
            Divider(),
            24.paddingVertical,
            Text(
              "Basic Button - Elevated",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            24.paddingVertical,
            // elevated
            Wrap(
              spacing: 8,
              runSpacing: 12,
              children: [
                BasicButton.elevated(
                  text: 'Active',
                  onPressed: () {},
                  size: BasicButtonSize.large, // Example size
                ),
                // 8.paddingHorizontal,
                BasicButton.elevated(
                  text: 'Disabled',
                  state: BasicButtonEventState.disabled,
                  size: BasicButtonSize.large, // Example size
                  onPressed: () {},
                ),
                // 8.paddingHorizontal,
                BasicButton.elevated(
                  text: 'Loading',
                  state: BasicButtonEventState.loading,
                  size: BasicButtonSize.large, // Example size
                  onPressed: () {},
                ),
              ],
            ),
            12.paddingVertical,
            Wrap(
              spacing: 8,
              runSpacing: 12,
              children: [
                BasicButton.elevated(
                  text: 'Active',
                  onPressed: () {},
                  size: BasicButtonSize.medium, // Example size
                ),
                // 8.paddingHorizontal,
                BasicButton.elevated(
                  text: 'Disabled',
                  state: BasicButtonEventState.disabled,
                  size: BasicButtonSize.medium, // Example size
                  onPressed: () {},
                ),
                // 8.paddingHorizontal,
                BasicButton.elevated(
                  text: 'Loading',
                  state: BasicButtonEventState.loading,
                  size: BasicButtonSize.medium, // Example size
                  onPressed: () {},
                ),
              ],
            ),
            12.paddingVertical,
            Wrap(
              spacing: 8,
              runSpacing: 12,
              children: [
                BasicButton.elevated(
                  text: 'Active',
                  onPressed: () {},
                  size: BasicButtonSize.small, // Example size
                ),
                // 8.paddingHorizontal,
                BasicButton.elevated(
                  text: 'Disabled',
                  state: BasicButtonEventState.disabled,
                  size: BasicButtonSize.small, // Example size
                  onPressed: () {},
                ),
                // 8.paddingHorizontal,
                BasicButton.elevated(
                  text: 'Loading',
                  state: BasicButtonEventState.loading,
                  size: BasicButtonSize.small, // Example size
                  onPressed: () {},
                ),
              ],
            ),
            12.paddingVertical,
            // elevated with icon start
            Wrap(
              spacing: 8,
              runSpacing: 12,

              children: [
                BasicButton.elevated(
                  text: 'Active',
                  icon: const Icon(Icons.favorite),
                  onPressed: () {},
                ),
                // 8.paddingHorizontal,
                BasicButton.elevated(
                  text: 'Disabled',
                  icon: const Icon(Icons.favorite),
                  state: BasicButtonEventState.disabled,
                  onPressed: () {},
                ),
                // 8.paddingHorizontal,
                BasicButton.elevated(
                  text: 'Loading',
                  icon: const Icon(Icons.favorite),
                  state: BasicButtonEventState.loading,
                  onPressed: () {},
                ),
              ],
            ),
            12.paddingVertical,
            Wrap(
              spacing: 8,
              runSpacing: 12,

              children: [
                BasicButton.elevated(
                  text: 'Active',
                  icon: const Icon(Icons.favorite),
                  iconAlignment: IconAlignment.end,
                  onPressed: () {},
                ),
                // 8.paddingHorizontal,
                BasicButton.elevated(
                  text: 'Disabled',
                  icon: const Icon(Icons.favorite),
                  state: BasicButtonEventState.disabled,
                  iconAlignment: IconAlignment.end,
                  onPressed: () {},
                ),
                // 8.paddingHorizontal,
                BasicButton.elevated(
                  text: 'Loading',
                  icon: const Icon(Icons.favorite),
                  state: BasicButtonEventState.loading,
                  iconAlignment: IconAlignment.end,
                  onPressed: () {},
                ),
              ],
            ),
            12.paddingVertical,
            Divider(),
            24.paddingVertical,
            // basic button - filled
            Text(
              "Basic Button - Filled",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            24.paddingVertical,
            Wrap(
              spacing: 8,
              runSpacing: 12,
              children: [
                BasicButton.filled(text: 'Active', onPressed: () {}),
                // 8.paddingHorizontal,
                BasicButton.filled(
                  text: 'Disabled',
                  state: BasicButtonEventState.disabled,
                  onPressed: () {},
                ),
                // 8.paddingHorizontal,
                BasicButton.filled(
                  text: 'Loading',
                  state: BasicButtonEventState.loading,
                  onPressed: () {},
                ),
              ],
            ),
            12.paddingVertical,
            // filled with icon
            Wrap(
              spacing: 8,
              runSpacing: 12,
              children: [
                BasicButton.filled(
                  text: 'Active',
                  icon: const Icon(Icons.favorite),
                  onPressed: () {},
                ),
                // 8.paddingHorizontal,
                BasicButton.filled(
                  text: 'Disabled',
                  icon: const Icon(Icons.favorite),
                  state: BasicButtonEventState.disabled,
                  onPressed: () {},
                ),
                // 8.paddingHorizontal,
                BasicButton.filled(
                  text: 'Loading',
                  icon: const Icon(Icons.favorite),
                  state: BasicButtonEventState.loading,
                  onPressed: () {},
                ),
              ],
            ),
            12.paddingVertical,
            Wrap(
              spacing: 8,
              runSpacing: 12,
              children: [
                BasicButton.filled(
                  text: 'Active',
                  icon: const Icon(Icons.favorite),
                  iconAlignment: IconAlignment.end,
                  onPressed: () {},
                ),
                // 8.paddingHorizontal,
                BasicButton.filled(
                  text: 'Disabled',
                  icon: const Icon(Icons.favorite),
                  state: BasicButtonEventState.disabled,
                  iconAlignment: IconAlignment.end,
                  onPressed: () {},
                ),
                // 8.paddingHorizontal,
                BasicButton.filled(
                  text: 'Loading',
                  icon: const Icon(Icons.favorite),
                  state: BasicButtonEventState.loading,
                  iconAlignment: IconAlignment.end,
                  onPressed: () {},
                ),
              ],
            ),
            12.paddingVertical,
            Divider(),
            24.paddingVertical,
            // basic button - outlined
            Text(
              "Basic Button - Outlined",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            24.paddingVertical,
            // outlined
            Wrap(
              spacing: 8,
              runSpacing: 12,
              children: [
                BasicButton.outlined(text: 'Active', onPressed: () {}),
                // 8.paddingHorizontal,
                BasicButton.outlined(
                  text: 'Disabled',
                  state: BasicButtonEventState.disabled,
                  onPressed: () {},
                ),
                // 8.paddingHorizontal,
                BasicButton.outlined(
                  text: 'Loading',
                  state: BasicButtonEventState.loading,
                  onPressed: () {},
                ),
              ],
            ),
            12.paddingVertical,
            // outlined with icon
            Wrap(
              spacing: 8,
              runSpacing: 12,
              children: [
                BasicButton.outlined(
                  text: 'Active',
                  icon: const Icon(Icons.favorite),
                  onPressed: () {},
                ),
                // 8.paddingHorizontal,
                BasicButton.outlined(
                  text: 'Disabled',
                  icon: const Icon(Icons.favorite),
                  state: BasicButtonEventState.disabled,
                  onPressed: () {},
                ),
                // 8.paddingHorizontal,
                BasicButton.outlined(
                  text: 'Loading',
                  icon: const Icon(Icons.favorite),
                  state: BasicButtonEventState.loading,
                  onPressed: () {},
                ),
              ],
            ),
            12.paddingVertical,
            Wrap(
              spacing: 8,
              runSpacing: 12,
              children: [
                BasicButton.outlined(
                  text: 'Active',
                  icon: const Icon(Icons.favorite),
                  iconAlignment: IconAlignment.end,
                  onPressed: () {},
                ),
                // 8.paddingHorizontal,
                BasicButton.outlined(
                  text: 'Disabled',
                  icon: const Icon(Icons.favorite),
                  state: BasicButtonEventState.disabled,
                  iconAlignment: IconAlignment.end,
                  onPressed: () {},
                ),
                // 8.paddingHorizontal,
                BasicButton.outlined(
                  text: 'Loading',
                  icon: const Icon(Icons.favorite),
                  state: BasicButtonEventState.loading,
                  iconAlignment: IconAlignment.end,
                  onPressed: () {},
                ),
              ],
            ),
            12.paddingVertical,
            Divider(),
            24.paddingVertical,
            // basic button - text
            Text(
              "Basic Button - Text",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            24.paddingVertical,
            // text
            Wrap(
              spacing: 8,
              runSpacing: 12,
              children: [
                BasicButton.text(text: 'Active', onPressed: () {}),
                // 8.paddingHorizontal,
                BasicButton.text(
                  text: 'Disabled',
                  state: BasicButtonEventState.disabled,
                  onPressed: () {},
                ),
                // 8.paddingHorizontal,
                BasicButton.text(
                  text: 'Loading',
                  state: BasicButtonEventState.loading,
                  onPressed: () {},
                ),
              ],
            ),
            12.paddingVertical,
            // text with icon
            Wrap(
              spacing: 8,
              runSpacing: 12,
              children: [
                BasicButton.text(
                  text: 'Active',
                  icon: const Icon(Icons.favorite),
                  onPressed: () {},
                ),
                // 8.paddingHorizontal,
                BasicButton.text(
                  text: 'Disabled',
                  icon: const Icon(Icons.favorite),
                  state: BasicButtonEventState.disabled,
                  onPressed: () {},
                ),
                // 8.paddingHorizontal,
                BasicButton.text(
                  text: 'Loading',
                  icon: const Icon(Icons.favorite),
                  state: BasicButtonEventState.loading,
                  onPressed: () {},
                ),
              ],
            ),
            12.paddingVertical,
            Wrap(
              spacing: 8,
              runSpacing: 12,
              children: [
                BasicButton.text(
                  text: 'Active',
                  icon: const Icon(Icons.favorite),
                  iconAlignment: IconAlignment.end,
                  onPressed: () {},
                ),
                // 8.paddingHorizontal,
                BasicButton.text(
                  text: 'Disabled',
                  icon: const Icon(Icons.favorite),
                  state: BasicButtonEventState.disabled,
                  iconAlignment: IconAlignment.end,
                  onPressed: () {},
                ),
                // 8.paddingHorizontal,
                BasicButton.text(
                  text: 'Loading',
                  icon: const Icon(Icons.favorite),
                  state: BasicButtonEventState.loading,
                  iconAlignment: IconAlignment.end,
                  onPressed: () {},
                ),
              ],
            ),
            24.paddingVertical,
          ],
        ),
      ),
    );
  }
}
