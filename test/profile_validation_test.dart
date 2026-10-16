import 'package:flutter_test/flutter_test.dart';
import 'package:study_buddy_finder/validation/profile_validation.dart';

void main() {
  test('accepts a name that is under 30 characters', () {
    expect(validateName('Bob'), isNull);
  });

  test('accepts a name longer exactly 30 characters', () {
    expect(validateName('AlexanderChristopherMontgomery'), isNull);
  });

  test('rejects a name with more than 30 characters', () {
    expect(validateName('AlexanderChristopherMontgomeryAdams'), 'Name is longer than 30 characters',);
  });

  test('rejects an empty name', () {
    expect(validateName(''), 'Name cannot be empty',);
  });
}