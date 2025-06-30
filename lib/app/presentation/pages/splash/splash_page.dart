import 'package:flutter_clean_blox_template/shared/shared.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

    _initialize(context);
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
    return const _BuildBody();
  }

  void _initialize(BuildContext context) async {
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (!context.mounted) return;
      context.go(to: '/');
    });
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
