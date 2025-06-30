import 'package:flutter_clean_blox_template/core/core.dart';
import 'package:flutter_clean_blox_template/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:flutter_clean_blox_template/features/auth/presentation/blocs/sign_in/sign_in_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_blox_template/shared/shared.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  bool isValid = false;

  late final SignInBloc _signInBloc;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _signInBloc = sl.get();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _signInBloc,
      child: BlocListener<SignInBloc, SignInState>(
        listener: (context, state) {
          if (state is SignInSuccess) {
            sl<AuthBloc>().add(AuthCheckRequestedEvent());
          } else if (state is SignInFailure) {
            context.showError(state.error);
          }
        },
        child: BasicScaffold(
          body: Form(
            key: _formKey,
            onChanged: () {
              final isEmailFilled = _emailController.text.isNotEmpty;
              final isPasswordFilled = _passwordController.text.isNotEmpty;
              if (isValid != (isEmailFilled && isPasswordFilled)) {
                setState(() {
                  isValid = isEmailFilled && isPasswordFilled;
                });
              }
            },
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Padding(
              padding: 24.edgeHorizontal,
              child: Column(
                children: [
                  100.paddingVertical,
                  Text(
                    context.l10n.signIn,
                    style: context.textTheme.headlineMedium,
                  ),
                  16.paddingVertical,
                  Text(
                    context.l10n.signInDescription,
                    style: context.textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  16.paddingVertical,
                  BlocBuilder<SignInBloc, SignInState>(
                    builder: (context, state) {
                      final isLoading = state is SignInLoading;
                      return BasicTextField.outlined(
                        field: 'email',
                        controller: _emailController,
                        labelText: context.l10n.email,
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.none,
                        prefixIcon: const Icon(Icons.email),
                        validationUIError: state.validationUIError,
                        hintText: context.l10n.emailHint,
                        keyboardType: TextInputType.emailAddress,
                        readOnly: isLoading,
                      );
                    },
                  ),
                  16.paddingVertical,
                  BlocBuilder<SignInBloc, SignInState>(
                    builder: (context, state) {
                      return BasicTextField.underline(
                        field: 'password',
                        prefixIcon: const Icon(Icons.lock),
                        controller: _passwordController,
                        labelText: context.l10n.password,
                        hintText: context.l10n.passwordHint,
                        validationUIError: state.validationUIError,
                        obscureText: true,
                        readOnly: state is SignInLoading,
                      );
                    },
                  ),
                  32.paddingVertical,
                  BlocBuilder<SignInBloc, SignInState>(
                    builder: (context, state) {
                      final isLoading = state is SignInLoading;
                      return BasicButton.filled(
                        isFullWidth: true,
                        text: context.l10n.signInButton,
                        icon: Icon(Icons.login),
                        state: isLoading
                            ? BasicButtonEventState.loading
                            : isValid
                            ? BasicButtonEventState.active
                            : BasicButtonEventState.disabled,
                        onPressed: () {
                          // Handle sign-in logic here
                          if (!isValid || isLoading) return;
                          if (!_formKey.currentState!.validate()) return;
                          _signInBloc.add(
                            SignInRequestedEvent(
                              email: _emailController.text,
                              password: _passwordController.text,
                            ),
                          );
                        },
                      );
                    },
                  ),
                  24.paddingVertical,
                  BasicButton.outlined(
                    isFullWidth: true,
                    icon: const Icon(Icons.app_registration),
                    text: context.l10n.signUpButton,
                    onPressed: () {
                      context.push(to: '/sign-up');
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
