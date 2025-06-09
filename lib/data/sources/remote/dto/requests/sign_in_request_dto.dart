import 'package:equatable/equatable.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

class SignInRequestDto extends Equatable {
  const SignInRequestDto({required this.email, required this.password});

  final String? email;
  final String? password;

  factory SignInRequestDto.fromJson(Map<String, dynamic> json) {
    return SignInRequestDto(email: json["email"], password: json["password"]);
  }

  Map<String, dynamic> toJson() => {"email": email, "password": password};

  @override
  String toString() {
    return "$email, $password, ";
  }

  @override
  List<Object?> get props => [email, password];
}
