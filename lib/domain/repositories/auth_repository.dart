import 'package:flutter_clean_blox_template/domain/models/credential.dart';
import 'package:flutter_clean_blox_template/domain/models/sign_in_request.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

abstract class IAuthRepository {
  Future<void> signInWithEmailAndPassword(SignInRequest request);
  Future<void> signOut();
  Future<bool> isSignedIn();
  Future<Credential?> getCredential();
}
