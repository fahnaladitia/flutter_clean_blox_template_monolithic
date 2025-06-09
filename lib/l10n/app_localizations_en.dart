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
  String get profile => 'Profile';

  @override
  String get profileDescription => 'View and edit your profile information';

  @override
  String get signOut => 'Sign Out';
}
