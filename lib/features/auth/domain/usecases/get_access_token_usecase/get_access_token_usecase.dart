import 'package:flutter_clean_blox_template/core/core.dart';
import 'package:flutter_clean_blox_template/features/auth/domain/repositories/auth_repository.dart';

class GetAccessTokenUsecase implements Usecase<String?> {
  final AuthRepository repository;

  GetAccessTokenUsecase({required this.repository});
  @override
  Future<String?> call() async {
    // Checking if the user is authenticated
    // If the user is authenticated, we retrieve the access token
    final isAuthenticated = await repository.isAuthenticated();
    if (isAuthenticated) {
      return await repository.getAccessToken();
    }
    // If the user is not authenticated, we return null
    return null;
  }
}
