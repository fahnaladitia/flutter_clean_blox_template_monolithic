import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_blox_template/app/router/route.dart';
import 'package:flutter_clean_blox_template/core/common/constants/app_constants.dart';
import 'package:flutter_clean_blox_template/core/di/injection.dart';
import 'package:flutter_clean_blox_template/presentation/blocs/auth/auth_bloc.dart';
import 'package:flutter_clean_blox_template/presentation/utils/context_ext.dart';
import 'package:go_router/go_router.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.top],
    );
    getIt.get<AuthBloc>().add(AuthCheckRequestedEvent());
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      bloc: getIt.get<AuthBloc>(),
      listener: (context, state) async {
        logger.i('SplashPage: AuthState: $state');

        if (state is AuthUnauthenticatedState) {
          await Future.delayed(const Duration(milliseconds: 1500));
          if (!context.mounted) return;
          context.goNamed(AppRoute.signIn);
        }

        if (state is AuthAuthenticatedState) {
          await Future.delayed(const Duration(milliseconds: 1500));
          if (!context.mounted) return;
          context.goNamed(AppRoute.main);
        }

        if (state is AuthErrorState) {
          context.showError(state.error);
        }
      },
      child: Scaffold(
        body: Image.asset(
          'assets/splash/splash_screen.png',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
      ),
    );
  }
}
