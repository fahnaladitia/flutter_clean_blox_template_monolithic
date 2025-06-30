import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_clean_blox_template/shared/shared.dart'; // atau ganti sesuai path ValidatorUtils kamu

void main() {
  group('ValidatorUtils', () {
    group('validateEmail', () {
      test('returns error when email is null', () {
        final result = ValidatorUtils.validateEmail(null);
        expect(result, 'Email cannot be empty');
      });

      test('returns error when email is empty', () {
        final result = ValidatorUtils.validateEmail('');
        expect(result, 'Email cannot be empty');
      });

      test('returns error when email format is invalid', () {
        final result = ValidatorUtils.validateEmail('invalid-email');
        expect(result, 'Invalid email format');
      });

      test('returns null when email is valid', () {
        final result = ValidatorUtils.validateEmail('test@example.com');
        expect(result, isNull);
      });
    });

    group('validatePassword', () {
      test('returns error when password is null', () {
        final result = ValidatorUtils.validatePassword(null);
        expect(result, 'Password cannot be empty');
      });

      test('returns error when password is empty', () {
        final result = ValidatorUtils.validatePassword('');
        expect(result, 'Password cannot be empty');
      });

      test('returns error when password is too short', () {
        final result = ValidatorUtils.validatePassword('abc12');
        expect(
          result,
          'Password must be at least 8 characters long and contain at least one letter and one number',
        );
      });

      test('returns error when password has no number', () {
        final result = ValidatorUtils.validatePassword('abcdefgh');
        expect(
          result,
          'Password must be at least 8 characters long and contain at least one letter and one number',
        );
      });

      test('returns error when password has no letter', () {
        final result = ValidatorUtils.validatePassword('12345678');
        expect(
          result,
          'Password must be at least 8 characters long and contain at least one letter and one number',
        );
      });

      test('returns null when password is valid', () {
        final result = ValidatorUtils.validatePassword('abc12345');
        expect(result, isNull);
      });
    });

    group('validatePasswordConfirmation', () {
      test('returns error when confirmPassword is null', () {
        final result = ValidatorUtils.validatePasswordConfirmation(
          'password123',
          null,
        );
        expect(result, 'Confirm password cannot be empty');
      });

      test('returns error when confirmPassword is empty', () {
        final result = ValidatorUtils.validatePasswordConfirmation(
          'password123',
          '',
        );
        expect(result, 'Confirm password cannot be empty');
      });

      test('returns error when passwords do not match', () {
        final result = ValidatorUtils.validatePasswordConfirmation(
          'password123',
          'password456',
        );
        expect(result, 'Passwords do not match');
      });

      test('returns null when passwords match', () {
        final result = ValidatorUtils.validatePasswordConfirmation(
          'password123',
          'password123',
        );
        expect(result, isNull);
      });
    });
  });
}
