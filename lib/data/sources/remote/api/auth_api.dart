import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_clean_blox_template/data/sources/remote/dto/requests/sign_in_request_dto.dart';
import 'package:flutter_clean_blox_template/data/sources/remote/dto/responses/sign_in_response_dto.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

class AuthApi {
  final Dio dio;

  AuthApi(this.dio);

  Future<SignInResponseDto> signInWithEmailAndPassword(
    SignInRequestDto request,
  ) async {
    // Example of a real network request
    // final response = await dio.post('/sign-in', data: request.toJson());
    // return SignInResponseDto.fromJson(response.data);

    // Simulating a network request with a delay
    final jsonString = await rootBundle.loadString(
      'assets/example_responses/sign_in_response.json',
    );

    final jsonMap = json.decode(jsonString);

    return SignInResponseDto.fromJson(jsonMap);
  }
}
