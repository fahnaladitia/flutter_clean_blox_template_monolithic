import 'package:flutter_clean_blox_template/data/sources/local/entities/credential_entity.dart';
import 'package:flutter_clean_blox_template/data/sources/remote/dto/responses/sign_in_response_dto.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

extension SignInResponseMapper on SignInResponseDto {
  CredentialEntity toEntity() {
    return CredentialEntity(
      token: data?.token ?? '',
      userId: data?.userId ?? '',
      refreshToken: data?.refreshToken ?? '',
    );
  }
}
