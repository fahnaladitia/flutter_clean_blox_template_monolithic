import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_id.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('id'),
  ];

  /// Description for the sign-in page
  ///
  /// In en, this message translates to:
  /// **'Sign in to your account'**
  String get signInDescription;

  /// Text for the sign-in button
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signInButton;

  /// Description for the sign-up page
  ///
  /// In en, this message translates to:
  /// **'Create a new account'**
  String get signUpDescription;

  /// Text for the sign-up button
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUpButton;

  /// Title for the sign-in page
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// Title for the sign-up page
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// Label for the name input field
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// Hint text for the name input field
  ///
  /// In en, this message translates to:
  /// **'Enter your full name'**
  String get nameHint;

  /// Label for the email input field
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// Hint text for the email input field
  ///
  /// In en, this message translates to:
  /// **'Enter your email address'**
  String get emailHint;

  /// Label for the password input field
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// Hint text for the password input field
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get passwordHint;

  /// Label for the confirm password input field
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// Hint text for the confirm password input field
  ///
  /// In en, this message translates to:
  /// **'Re-enter your password'**
  String get confirmPasswordHint;

  /// Text for the forgot password link
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// Text for the reset password button
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPassword;

  /// Title for the home page
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// Description for the home page
  ///
  /// In en, this message translates to:
  /// **'Welcome to the home page'**
  String get homeDescription;

  /// Title for the account page
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// Description for the account page
  ///
  /// In en, this message translates to:
  /// **'View and edit your account information'**
  String get accountDescription;

  /// Text for the sign-out button
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get signOut;

  /// Title for the buttons preview page
  ///
  /// In en, this message translates to:
  /// **'Buttons'**
  String get buttons;

  /// Title for the inputs preview page
  ///
  /// In en, this message translates to:
  /// **'Inputs'**
  String get inputs;

  /// Description for the inputs preview page
  ///
  /// In en, this message translates to:
  /// **'This is a preview page for inputs. You can see how the inputs look like and their states.'**
  String get inputsPreviewDescription;

  /// Description for the buttons preview page
  ///
  /// In en, this message translates to:
  /// **'This is a preview page for buttons. You can see how the buttons look like and their states.'**
  String get buttonsPreviewDescription;

  /// Title for the selections preview page
  ///
  /// In en, this message translates to:
  /// **'Selections'**
  String get selections;

  /// Description for the selections preview page
  ///
  /// In en, this message translates to:
  /// **'This is a preview page for selections. You can see how the selections look like and their states.'**
  String get selectionsPreviewDescription;

  /// Title for the texts preview page
  ///
  /// In en, this message translates to:
  /// **'Texts'**
  String get texts;

  /// Description for the texts preview page
  ///
  /// In en, this message translates to:
  /// **'This is a preview page for texts. You can see how some texts look like and their type styles.'**
  String get textsPreviewDescription;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'id'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'id':
      return AppLocalizationsId();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
