import 'package:flutter_clean_blox_template/data/sources/local/entities/credential_entity.dart';
import 'package:flutter_clean_blox_template/domain/models/credential.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

extension CredentialMapper on Credential {
  CredentialEntity toEntity() {
    return CredentialEntity(
      userId: userId,
      token: token,
      refreshToken: refreshToken,
    );
  }
}

extension CredentialEntityMapper on CredentialEntity {
  Credential toDomain() {
    return Credential(
      userId: userId ?? '',
      token: token ?? '',
      refreshToken: refreshToken ?? '',
    );
  }
}
