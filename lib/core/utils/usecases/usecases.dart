part of '../utils.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

/// Usecase is an abstract class that defines a contract for use cases in the application.
/// It provides a method to execute the use case without any parameters.
///
/// Example:
/// ```dart
/// class MyUseCase extends Usecase<MyResultType> {
///  @override
/// Future<MyResultType> call() async {
/// //   // Implementation of the use case logic
///  }
/// ```dart
abstract class Usecase<T> {
  Future<T> call();
}

/// UsecasesWithParam is an abstract class that defines a contract for use cases that require parameters.
/// It provides a method to execute the use case with the specified parameters.
///
/// Example:
/// ```dart
/// class MyUseCaseWithParams extends UsecaseWithParams<MyResultType, MyParamsType> {
/// @override
/// Future<MyResultType> call(MyParamsType param) async {
///   //   // Implementation of the use case logic with parameters
/// }
/// ```dart
abstract class UsecaseWithParam<T, Param> {
  Future<T> call(Param param);
}
