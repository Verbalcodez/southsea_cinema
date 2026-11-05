import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';

void main() {
  group('Movie', () {
    test('constructor assigns all properties', () {
      const movie = Movie(
        id: 'rocky',
        title: 'Rocky',
        synopsis:
            'A small-time boxer gets a once-in-a-lifetime chance to fight the heavyweight world champion..',
        ageRating: '15',
        screeningTime: '2 hours 56 minutes',
        ticketPrice: 12.00,
        imagePath: 'assets/images/2.jpg',
      );

      expect(movie.id, 'rocky');
      expect(movie.title, 'Rocky');
      expect(
          movie.synopsis,
          'A small-time boxer gets a once-in-a-lifetime chance to fight '
          'the heavyweight world champion..');
      expect(movie.ageRating, '15');
      expect(movie.screeningTime, '2 hours 56 minutes');
      expect(movie.ticketPrice, 12.00);
      expect(movie.imagePath, 'assets/images/2.jpg');
    });

    test('formattedPrice shows two decimal places for a whole pound price',
        () {
      const movie = Movie(
        id: 'fast-furious',
        title: 'Fast & Furious',
        synopsis: 'Street racing.',
        ageRating: '12A',
        screeningTime: '1 hour 47 minutes',
        ticketPrice: 10.00,
        imagePath: 'assets/images/1.jpg',
      );

      expect(movie.formattedPrice, '£10.00');
    });

    test('formattedPrice shows two decimal places for a price with pence',
        () {
      const movie = Movie(
        id: 'creed',
        title: 'Creed',
        synopsis: 'Apollo Creed\'s son.',
        ageRating: '12A',
        screeningTime: '2 hours 13 minutes',
        ticketPrice: 11.50,
        imagePath: 'assets/images/3.jpg',
      );

      expect(movie.formattedPrice, '£11.50');
    });
  });
}
