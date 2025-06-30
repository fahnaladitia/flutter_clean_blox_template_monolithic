import 'package:flutter/material.dart';
import 'package:flutter_clean_blox_template/shared/shared.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/pahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
      appBar: AppBar(title: Text(context.l10n.home)),
      isSingleChildScrollView: false,
      body: Center(
        child: Text(
          context.l10n.homeDescription,
          style: context.textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
