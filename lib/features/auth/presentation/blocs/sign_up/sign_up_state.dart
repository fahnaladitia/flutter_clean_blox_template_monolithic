part of 'sign_up_bloc.dart';

sealed class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];

  ValidationUIError? get validationUIError => this is SignUpFailure
      ? (this as SignUpFailure).error.validationUIError
      : null;
}

final class SignUpInitial extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpSuccess extends SignUpState {}

final class SignUpFailure extends SignUpState {
  final UIError error;

  const SignUpFailure({required this.error});

  @override
  List<Object> get props => [error];
}
