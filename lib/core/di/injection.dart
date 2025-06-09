import 'package:dio/dio.dart';
import 'package:flutter_clean_blox_template/domain/usecases/auth/get_credential/get_credential_usecase.dart';
import 'package:flutter_clean_blox_template/domain/usecases/auth/isSignedIn/is_signed_in_usecase.dart';
import 'package:flutter_clean_blox_template/domain/usecases/auth/sign_in_with_email_and_password/sign_in_with_email_and_password_usecase.dart';
import 'package:flutter_clean_blox_template/domain/usecases/auth/sign_out/sign_out_usecase.dart';
import 'package:flutter_clean_blox_template/presentation/blocs/auth/auth_bloc.dart';
import 'package:flutter_clean_blox_template/presentation/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:flutter_clean_blox_template/data/repositories/auth_repository.dart';
import 'package:flutter_clean_blox_template/domain/repositories/auth_repository.dart';

import 'package:flutter_clean_blox_template/data/sources/local/databases/auth_database.dart';
import 'package:flutter_clean_blox_template/data/sources/remote/api/auth_api.dart';

import 'package:flutter_clean_blox_template/core/common/constants/app_constants.dart';
import 'package:flutter_clean_blox_template/core/config/app_rest_client.dart';

part 'bloc_module.dart';
part 'database_module.dart';
part 'network_module.dart';
part 'repository_module.dart';
part 'usecase_module.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

final getIt = GetIt.instance;

class Injection {
  Injection._();

  /// Initializes all dependency injection modules in the correct order.
  /// This method should be called at the start of the application
  /// to ensure that all dependencies are registered before they are used.
  /// The order of initialization is important:
  /// 1. NetworkModule - Initializes network-related dependencies.
  /// 2. DatabaseModule - Initializes local databases.
  /// 3. RepositoryModule - Initializes repositories that depend on network services.
  /// 4. UseCaseModule - Initializes use cases that depend on repositories.
  /// 5. BlocModule - Initializes BLoCs that depend on use cases.
  /// This ensures that all dependencies are available when needed.
  /// Example usage:
  /// ```dart
  /// void main() async {
  ///   WidgetsFlutterBinding.ensureInitialized();
  ///   await Injection.init();
  ///   runApp(MyApp());
  /// }
  /// ```
  ///
  static Future<void> init() async {
    await NetworkModule.init();
    await DatabaseModule.init();
    await RepositoryModule.init();
    await UseCaseModule.init();
    await BlocModule.init();
  }
}
