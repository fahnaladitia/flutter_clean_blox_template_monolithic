import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_clean_blox_template/core/utils/validators.dart';

void main() {
  group('Validators', () {
    group('validateEmail', () {
      test('returns error when email is null', () {
        expect(Validators.validateEmail(null), 'Email cannot be empty');
      });

      test('returns error when email is empty', () {
        expect(Validators.validateEmail(''), 'Email cannot be empty');
      });

      test('returns error when email is invalid', () {
        expect(
          Validators.validateEmail('invalidemail'),
          'Invalid email format',
        );
        expect(Validators.validateEmail('user@'), 'Invalid email format');
        expect(Validators.validateEmail('@domain.com'), 'Invalid email format');
        expect(Validators.validateEmail('user@domain'), 'Invalid email format');
      });

      test('returns null when email is valid', () {
        expect(Validators.validateEmail('user@example.com'), null);
      });
    });

    group('validatePassword', () {
      test('returns error when password is null', () {
        expect(Validators.validatePassword(null), 'Password cannot be empty');
      });

      test('returns error when password is empty', () {
        expect(Validators.validatePassword(''), 'Password cannot be empty');
      });

      test('returns error when password is less than 8 characters', () {
        expect(
          Validators.validatePassword('abc12'),
          contains('at least 8 characters'),
        );
      });

      test('returns error when password does not contain number', () {
        expect(
          Validators.validatePassword('abcdefgh'),
          contains('one letter and one number'),
        );
      });

      test('returns error when password does not contain letter', () {
        expect(
          Validators.validatePassword('12345678'),
          contains('one letter and one number'),
        );
      });

      test('returns null when password is valid', () {
        expect(Validators.validatePassword('abc12345'), null);
      });
    });

    group('validatePasswordConfirmation', () {
      test('returns error when confirmation is null', () {
        expect(
          Validators.validatePasswordConfirmation('password123', null),
          'Confirm password cannot be empty',
        );
      });

      test('returns error when confirmation is empty', () {
        expect(
          Validators.validatePasswordConfirmation('password123', ''),
          'Confirm password cannot be empty',
        );
      });

      test('returns error when confirmation does not match', () {
        expect(
          Validators.validatePasswordConfirmation('password123', 'password124'),
          'Passwords do not match',
        );
      });

      test('returns null when confirmation matches password', () {
        expect(
          Validators.validatePasswordConfirmation('password123', 'password123'),
          null,
        );
      });
    });
  });
}
