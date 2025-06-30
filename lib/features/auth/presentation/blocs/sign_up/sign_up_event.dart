part of 'sign_up_bloc.dart';

sealed class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];

  @override
  bool get stringify => true;
}

final class SignUpRequestedEvent extends SignUpEvent {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;

  const SignUpRequestedEvent({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  @override
  List<Object> get props => [name, email, password, confirmPassword];
}
