// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get signInDescription => 'Masuk ke akun Anda';

  @override
  String get signInButton => 'Masuk';

  @override
  String get signUpDescription => 'Buat akun baru';

  @override
  String get signUpButton => 'Daftar';

  @override
  String get email => 'Email';

  @override
  String get emailHint => 'Masukkan alamat email Anda';

  @override
  String get password => 'Kata Sandi';

  @override
  String get passwordHint => 'Masukkan kata sandi Anda';

  @override
  String get confirmPassword => 'Konfirmasi Kata Sandi';

  @override
  String get confirmPasswordHint => 'Masukkan kembali kata sandi Anda';

  @override
  String get forgotPassword => 'Lupa Kata Sandi?';

  @override
  String get resetPassword => 'Atur Ulang Kata Sandi';

  @override
  String get home => 'Beranda';

  @override
  String get homeDescription => 'Selamat datang di halaman beranda';

  @override
  String get profile => 'Profil';

  @override
  String get profileDescription => 'Kelola informasi profil Anda';

  @override
  String get signOut => 'Keluar';
}
