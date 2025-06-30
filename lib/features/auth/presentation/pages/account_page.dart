import 'package:flutter_clean_blox_template/core/core.dart';
import 'package:flutter_clean_blox_template/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:flutter/material.dart';

import 'package:flutter_clean_blox_template/shared/shared.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/pahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
      appBar: AppBar(title: Text(context.l10n.account)),
      isSingleChildScrollView: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.l10n.accountDescription,
              style: context.textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            16.paddingVertical,
            BasicButton.elevated(
              text: context.l10n.signOut,
              icon: const Icon(Icons.logout),

              onPressed: () {
                final authBloc = sl.get<AuthBloc>();
                authBloc.add(AuthSignOutRequestedEvent());
              },
            ),
          ],
        ),
      ),
    );
  }
}
