import 'package:flutter/material.dart';
import 'package:flutter_clean_blox_template/shared/shared.dart';

class TextPreviewPage extends StatelessWidget {
  const TextPreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
      appBar: AppBar(title: Text(context.l10n.texts), centerTitle: true),
      body: Padding(
        padding: 24.edgeHorizontal,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // All sizes of text widgets
            24.paddingVertical,
            Text(
              context.l10n.textsPreviewDescription,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            24.paddingVertical,
            // divider
            Divider(),
            24.paddingVertical,
            Text(
              "Display Large",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            16.paddingVertical,
            Text(
              "Display Medium",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            16.paddingVertical,
            Text(
              "Display Small",
              style: Theme.of(context).textTheme.displaySmall,
            ),
            16.paddingVertical,
            Text(
              "Headline Large",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            16.paddingVertical,
            Text(
              "Headline Medium",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            16.paddingVertical,
            Text(
              "Headline Small",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            16.paddingVertical,
            Text("Title Large", style: Theme.of(context).textTheme.titleLarge),
            16.paddingVertical,
            Text(
              "Title Medium",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            16.paddingVertical,
            Text("Title Small", style: Theme.of(context).textTheme.titleSmall),
            16.paddingVertical,
            Text("Body Large", style: Theme.of(context).textTheme.bodyLarge),
            16.paddingVertical,
            Text("Body Medium", style: Theme.of(context).textTheme.bodyMedium),
            16.paddingVertical,
            Text("Body Small", style: Theme.of(context).textTheme.bodySmall),
            16.paddingVertical,
          ],
        ),
      ),
    );
  }
}
