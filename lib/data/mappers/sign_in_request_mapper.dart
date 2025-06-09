import 'package:flutter_clean_blox_template/data/sources/remote/dto/requests/sign_in_request_dto.dart';
import 'package:flutter_clean_blox_template/domain/models/sign_in_request.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

extension SignInRequestMapper on SignInRequest {
  SignInRequestDto toDto() {
    return SignInRequestDto(email: email, password: password);
  }
}

extension SignInRequestDtoMapper on SignInRequestDto {
  SignInRequest toDomain() {
    return SignInRequest(email: email ?? '', password: password ?? '');
  }
}
