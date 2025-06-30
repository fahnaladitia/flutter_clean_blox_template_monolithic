import 'package:flutter_clean_blox_template/core/core.dart';
import 'package:flutter_clean_blox_template/features/auth/domain/repositories/auth_repository.dart';

class SignOutUsecase implements Usecase<void> {
  final AuthRepository repository;

  SignOutUsecase({required this.repository});
  @override
  Future<void> call() async {
    // Checking if the user is authenticated
    // If the user is authenticated, we retrieve the access token
    final isAuthenticated = await repository.isAuthenticated();
    if (isAuthenticated) {
      // If the user is authenticated, we clear the authentication data
      await repository.signOut();
    }
  }
}
