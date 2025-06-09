import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_blox_template/app/router/route.dart';
import 'package:flutter_clean_blox_template/core/di/injection.dart';
import 'package:flutter_clean_blox_template/presentation/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:flutter_clean_blox_template/presentation/utils/context_ext.dart';
import 'package:flutter_clean_blox_template/presentation/utils/edge_insets_ext.dart';
import 'package:flutter_clean_blox_template/presentation/utils/spacer_ext.dart';
import 'package:flutter_clean_blox_template/presentation/widgets/basic_button.dart';
import 'package:flutter_clean_blox_template/presentation/widgets/basic_scaffold.dart';
import 'package:flutter_clean_blox_template/presentation/widgets/basic_text_input.dart';

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
    _signInBloc = getIt.get();
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
            context.pushNamedAndRemoveUntil(AppRoute.main);
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
              padding: 24.edgeX,
              child: Column(
                children: [
                  100.paddingY,
                  Text('Sign In', style: context.textTheme.headlineMedium),
                  16.paddingY,
                  Text(
                    context.l10n.signInDescription,
                    style: context.textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  16.paddingY,
                  BlocBuilder<SignInBloc, SignInState>(
                    builder: (context, state) {
                      final isLoading = state is SignInLoading;
                      return BasicTextInput(
                        controller: _emailController,
                        labelText: context.l10n.email,
                        hintText: context.l10n.emailHint,
                        keyboardType: TextInputType.emailAddress,
                        readOnly: isLoading,
                      );
                    },
                  ),
                  16.paddingY,
                  BlocBuilder<SignInBloc, SignInState>(
                    builder: (context, state) {
                      return BasicTextInput(
                        controller: _passwordController,
                        labelText: context.l10n.password,
                        hintText: context.l10n.passwordHint,
                        obscureText: true,
                        readOnly: state is SignInLoading,
                      );
                    },
                  ),
                  16.paddingY,
                  BlocBuilder<SignInBloc, SignInState>(
                    builder: (context, state) {
                      final isLoading = state is SignInLoading;
                      return BasicButton.primary(
                        text: context.l10n.signInButton,
                        state: isLoading
                            ? BasicButtonState.loading
                            : isValid
                            ? BasicButtonState.active
                            : BasicButtonState.disabled,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
