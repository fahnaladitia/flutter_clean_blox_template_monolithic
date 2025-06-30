import 'package:flutter_clean_blox_template/core/core.dart';
import 'package:flutter_clean_blox_template/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_blox_template/shared/shared.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

class SplashAuthPage extends StatefulWidget {
  const SplashAuthPage({super.key});

  @override
  State<SplashAuthPage> createState() => _SplashAuthPageState();
}

class _SplashAuthPageState extends State<SplashAuthPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.top],
    );
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      bloc: sl<AuthBloc>(),
      listener: (context, state) async {
        if (state is AuthAuthenticatedState) {
          await Future.delayed(const Duration(milliseconds: 1500));
          if (!context.mounted) return;
          context.go(to: '/');
        }
        if (state is AuthUnauthenticatedState) {
          await Future.delayed(const Duration(milliseconds: 1500));
          if (!context.mounted) return;
          context.go(to: '/sign-in');
        }
      },
      child: const _BuildBody(),
    );
  }
}

class _BuildBody extends StatelessWidget {
  const _BuildBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('SplashScaffold'),
      body: Image.asset(
        'assets/splash/splash_screen.png',
        key: const Key('SplashImage'),
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }
}
