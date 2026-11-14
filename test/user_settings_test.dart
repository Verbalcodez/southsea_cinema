import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/user_settings.dart';

void main() {
  group('UserSettings', () {
    test('default instance has empty values and false preference', () {
      const UserSettings settings = UserSettings();

      expect(settings.address, isEmpty);
      expect(settings.email, isEmpty);
      expect(settings.patronNumber, isEmpty);
      expect(settings.receiveNewsByEmail, isFalse);
    });

    test('configured instance stores the provided values', () {
      const UserSettings settings = UserSettings(
        address: 'Buckingham Building, Lion Terrace, Portsmouth PO1 3HE',
        email: 'alex@example.com',
        patronNumber: '1234',
        receiveNewsByEmail: true,
      );

      expect(settings.address,
          'Buckingham Building, Lion Terrace, Portsmouth PO1 3HE');
      expect(settings.email, 'alex@example.com');
      expect(settings.patronNumber, '1234');
      expect(settings.receiveNewsByEmail, isTrue);
    });
  });
}
