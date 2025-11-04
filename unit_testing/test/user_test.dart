import 'package:test/test.dart';

import 'package:unit_testing/models/user.dart';

void main() {
  group('User Model Tests', () {
    late User user;

    setUp(() {
      user = User(email: 'email@email.com', name: 'Malificent');
    });

    test('User should have an accessible name and emial', () {
      expect(user.name, 'Malificent');
      expect(user.email, 'email@email.com');
    });

    test('User should override toString correctly', () {
      //Arrange
      var expected = 'Name: Malificent, Email: email@email.com';

      //Act
      var actual = user.toString();

      //Assert
      expect(actual, expected);
    });
  });
}
