part of 'sign_in_bloc.dart';

sealed class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

final class SignInRequestedEvent extends SignInEvent {
  final String email;
  final String password;

  const SignInRequestedEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
