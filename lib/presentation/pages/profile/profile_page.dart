import 'package:flutter/material.dart';
import 'package:flutter_clean_blox_template/core/di/injection.dart';
import 'package:flutter_clean_blox_template/presentation/blocs/auth/auth_bloc.dart';
import 'package:flutter_clean_blox_template/presentation/utils/context_ext.dart';
import 'package:flutter_clean_blox_template/presentation/utils/spacer_ext.dart';
import 'package:flutter_clean_blox_template/presentation/widgets/basic_button.dart';
import 'package:flutter_clean_blox_template/presentation/widgets/basic_scaffold.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/pahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
      appBar: AppBar(title: Text(context.l10n.profile)),
      isSingleChildScrollView: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.l10n.profileDescription,
              style: context.textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            16.paddingY,
            BasicButton.secondary(
              text: context.l10n.signOut,
              icon: const Icon(Icons.logout),

              onPressed: () {
                getIt<AuthBloc>().add(AuthSignOutRequestedEvent());
              },
            ),
          ],
        ),
      ),
    );
  }
}
