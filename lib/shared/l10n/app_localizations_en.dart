// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get signInDescription => 'Sign in to your account';

  @override
  String get signInButton => 'Sign In';

  @override
  String get signUpDescription => 'Create a new account';

  @override
  String get signUpButton => 'Sign Up';

  @override
  String get signIn => 'Sign In';

  @override
  String get signUp => 'Sign Up';

  @override
  String get name => 'Name';

  @override
  String get nameHint => 'Enter your full name';

  @override
  String get email => 'Email';

  @override
  String get emailHint => 'Enter your email address';

  @override
  String get password => 'Password';

  @override
  String get passwordHint => 'Enter your password';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get confirmPasswordHint => 'Re-enter your password';

  @override
  String get forgotPassword => 'Forgot Password?';

  @override
  String get resetPassword => 'Reset Password';

  @override
  String get home => 'Home';

  @override
  String get homeDescription => 'Welcome to the home page';

  @override
  String get account => 'Account';

  @override
  String get accountDescription => 'View and edit your account information';

  @override
  String get signOut => 'Sign Out';

  @override
  String get buttons => 'Buttons';

  @override
  String get inputs => 'Inputs';

  @override
  String get inputsPreviewDescription =>
      'This is a preview page for inputs. You can see how the inputs look like and their states.';

  @override
  String get buttonsPreviewDescription =>
      'This is a preview page for buttons. You can see how the buttons look like and their states.';

  @override
  String get selections => 'Selections';

  @override
  String get selectionsPreviewDescription =>
      'This is a preview page for selections. You can see how the selections look like and their states.';

  @override
  String get texts => 'Texts';

  @override
  String get textsPreviewDescription =>
      'This is a preview page for texts. You can see how some texts look like and their type styles.';
}
