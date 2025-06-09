import 'package:flutter_clean_blox_template/data/mappers/credential_mapper.dart';
import 'package:flutter_clean_blox_template/data/mappers/sign_in_request_mapper.dart';
import 'package:flutter_clean_blox_template/data/mappers/sign_in_response_mapper.dart';
import 'package:flutter_clean_blox_template/data/sources/local/databases/auth_database.dart';
import 'package:flutter_clean_blox_template/data/sources/remote/api/auth_api.dart';
import 'package:flutter_clean_blox_template/domain/models/credential.dart';
import 'package:flutter_clean_blox_template/domain/models/sign_in_request.dart';
import 'package:flutter_clean_blox_template/domain/repositories/auth_repository.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

class AuthRepository implements IAuthRepository {
  final AuthDatabase authDatabase;
  final AuthApi authApi;

  AuthRepository(this.authDatabase, this.authApi);

  @override
  Future<void> signInWithEmailAndPassword(SignInRequest request) async {
    final response = await authApi.signInWithEmailAndPassword(request.toDto());

    final credEntity = response.toEntity();

    await authDatabase.saveCredential(credEntity);
  }

  @override
  Future<Credential?> getCredential() async {
    final credEntity = await authDatabase.getCredential();

    return credEntity?.toDomain();
  }

  @override
  Future<bool> isSignedIn() {
    return authDatabase.isSignedIn;
  }

  @override
  Future<void> signOut() {
    return authDatabase.clear();
  }
}
