import 'package:flutter_clean_blox_template/core/core.dart';
import 'package:flutter_clean_blox_template/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:flutter_clean_blox_template/features/auth/presentation/blocs/sign_up/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_clean_blox_template/shared/shared.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  bool isValid = false;

  late final SignUpBloc _signUpBloc;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _signUpBloc = sl.get();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _signUpBloc,
      child: BlocListener<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            sl<AuthBloc>().add(AuthCheckRequestedEvent());
          } else if (state is SignUpFailure) {
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
                    context.l10n.signUp,
                    style: context.textTheme.headlineMedium,
                  ),
                  16.paddingVertical,
                  Text(
                    context.l10n.signUpDescription,
                    style: context.textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  16.paddingVertical,
                  BlocBuilder<SignUpBloc, SignUpState>(
                    builder: (context, state) {
                      return BasicTextField.outlined(
                        field: 'name',
                        controller: _nameController,
                        labelText: context.l10n.name,
                        hintText: context.l10n.nameHint,
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.words,
                        prefixIcon: const Icon(Icons.person),
                        readOnly: state is SignUpLoading,
                        validationUIError: state.validationUIError,
                      );
                    },
                  ),
                  16.paddingVertical,
                  BlocBuilder<SignUpBloc, SignUpState>(
                    builder: (context, state) {
                      return BasicTextField.outlined(
                        field: 'email',
                        controller: _emailController,
                        labelText: context.l10n.email,
                        hintText: context.l10n.emailHint,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.none,
                        prefixIcon: const Icon(Icons.email),
                        readOnly: state is SignUpLoading,
                        validationUIError: state.validationUIError,
                      );
                    },
                  ),
                  16.paddingVertical,
                  BlocBuilder<SignUpBloc, SignUpState>(
                    builder: (context, state) {
                      return BasicTextField.outlined(
                        field: 'password',
                        controller: _passwordController,
                        labelText: context.l10n.password,
                        hintText: context.l10n.passwordHint,
                        textInputAction: TextInputAction.next,
                        textCapitalization: TextCapitalization.none,
                        prefixIcon: const Icon(Icons.lock),
                        obscureText: true,
                        readOnly: state is SignUpLoading,
                        validationUIError: state.validationUIError,
                      );
                    },
                  ),
                  16.paddingVertical,
                  BlocBuilder<SignUpBloc, SignUpState>(
                    builder: (context, state) {
                      return BasicTextField.underline(
                        field: 'confirm_password',
                        controller: _confirmPasswordController,
                        labelText: context.l10n.confirmPassword,
                        hintText: context.l10n.confirmPasswordHint,
                        textInputAction: TextInputAction.done,
                        textCapitalization: TextCapitalization.none,
                        prefixIcon: const Icon(Icons.lock),
                        obscureText: true,
                        readOnly: state is SignUpLoading,
                        validationUIError: state.validationUIError,
                      );
                    },
                  ),
                  32.paddingVertical,
                  BlocBuilder<SignUpBloc, SignUpState>(
                    builder: (context, state) {
                      final isLoading = state is SignUpLoading;
                      return BasicButton.filled(
                        text: context.l10n.signUpButton,
                        icon: const Icon(Icons.app_registration),
                        isFullWidth: true,
                        state: isLoading
                            ? BasicButtonEventState.loading
                            : isValid
                            ? BasicButtonEventState.active
                            : BasicButtonEventState.disabled,
                        onPressed: () {
                          // Handle sign-in logic here
                          if (!isValid || isLoading) return;
                          if (!_formKey.currentState!.validate()) return;
                          _signUpBloc.add(
                            SignUpRequestedEvent(
                              email: _emailController.text,
                              password: _passwordController.text,
                              name: _nameController.text,
                              confirmPassword: _confirmPasswordController.text,
                            ),
                          );
                        },
                      );
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
