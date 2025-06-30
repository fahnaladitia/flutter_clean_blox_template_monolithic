import 'package:flutter_clean_blox_template/features/auth/presentation/pages/account_page.dart';
import 'package:flutter_clean_blox_template/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

import 'package:flutter_clean_blox_template/shared/shared.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/pahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

class MainAuthPage extends StatefulWidget {
  const MainAuthPage({super.key});

  @override
  State<MainAuthPage> createState() => _MainAuthPageState();
}

class _MainAuthPageState extends State<MainAuthPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [HomePage(), AccountPage()];

    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: context.l10n.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: context.l10n.account,
          ),
        ],
      ),
    );
  }
}
