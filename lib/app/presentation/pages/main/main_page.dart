import 'package:flutter_clean_blox_template/features/home/presentation/pages/preview/buttons_preview_page.dart';
import 'package:flutter_clean_blox_template/features/home/presentation/pages/preview/inputs_preview_page.dart';
import 'package:flutter_clean_blox_template/features/home/presentation/pages/preview/selections_preview_page.dart';
import 'package:flutter_clean_blox_template/features/home/presentation/pages/preview/text_preview_page.dart';

import 'package:flutter/material.dart';

import 'package:flutter_clean_blox_template/shared/shared.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/pahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

class MainPage extends StatefulWidget {
  final bool withAuth;

  /// If [withAuth] is true, the page will listen to the [AuthBloc] state changes
  /// and navigate to the appropriate page based on the authentication state.
  /// If false, it will not listen to the [AuthBloc] state changes.
  /// This is useful for testing purposes or when you want to show the main page without any authentication logic.
  const MainPage({super.key, this.withAuth = false});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      ButtonsPreviewPage(),
      InputsPreviewPage(),
      SelectionsPreviewPage(),
      TextPreviewPage(),
    ];

    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.touch_app),
            label: context.l10n.buttons,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.keyboard),
            label: context.l10n.inputs,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.select_all),
            label: context.l10n.selections,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.text_fields),
            label: context.l10n.texts,
          ),
        ],
      ),
    );
  }
}
