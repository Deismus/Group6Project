import 'package:flutter_test/flutter_test.dart';
import 'package:study_buddy_finder/validation/profile_validation.dart';

void main() {
  test('TC-1: 8 chars with 3 special characters is accepted', () {
    expect(validatePassword('Abc!@#12'), isNull);
  });

  test('rejects an empty password', () {
    expect(validatePassword(''), isNotNull);
  });

  test('rejects a 7 character password', () {
    expect(validatePassword('Ab!@#12'), isNotNull);
  });

  test('rejects a 31 character password', () {
    expect(validatePassword('Abc!@#${'a' * 25}'), isNotNull);
  });

  test('rejects a password with only 2 special characters', () {
    expect(validatePassword('Abcd!@12'), isNotNull);
  });

  test('accepts a 30 character password with 3 special characters', () {
    expect(validatePassword('Abc!@#${'a' * 24}'), isNull);
  });
}