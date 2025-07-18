// Mocks generated by Mockito 5.4.6 from annotations
// in feature_auth/test/domain/usecases/get_user_id_usecase/get_user_id_usecase_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:flutter_clean_blox_template/features/auth/domain/repositories/auth_repository.dart'
    as _i2;
import 'package:flutter_clean_blox_template/features/auth/domain/usecases/get_user_id_usecase/get_user_id_usecase.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeAuthRepository_0 extends _i1.SmartFake
    implements _i2.AuthRepository {
  _FakeAuthRepository_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [GetUserIdUsecase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetUserIdUsecase extends _i1.Mock implements _i3.GetUserIdUsecase {
  MockGetUserIdUsecase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.AuthRepository get repository =>
      (super.noSuchMethod(
            Invocation.getter(#repository),
            returnValue: _FakeAuthRepository_0(
              this,
              Invocation.getter(#repository),
            ),
          )
          as _i2.AuthRepository);

  @override
  _i4.Future<String?> call() =>
      (super.noSuchMethod(
            Invocation.method(#call, []),
            returnValue: _i4.Future<String?>.value(),
          )
          as _i4.Future<String?>);
}
