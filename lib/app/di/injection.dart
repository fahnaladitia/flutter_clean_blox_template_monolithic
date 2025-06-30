import 'package:flutter_clean_blox_template/app/di/app_module.dart';
import 'package:flutter_clean_blox_template/core/core.dart';

import 'package:flutter_clean_blox_template/features/auth/di/auth_module.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

class Injection {
  Injection._();

  static Future<void> init() async {
    await CoreModule().init();
    await AppModule().init();
    await AuthModule().init();
  }
}
