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

    test('fromJson builds a movie with all fields and toJson reverses it',
        () {
      final Map<String, dynamic> json = <String, dynamic>{
        'id': 'fast-furious',
        'title': 'Fast & Furious',
        'synopsis':
            'A group of street racers become involved in dangerous races and criminal activities.',
        'ageRating': '12A',
        'screeningTime': '1 hour 47 minutes',
        'ticketPrice': 10.50,
        'imagePath': 'assets/images/1.jpg',
      };

      final Movie movie = Movie.fromJson(json);

      expect(movie.id, 'fast-furious');
      expect(movie.title, 'Fast & Furious');
      expect(
          movie.synopsis,
          'A group of street racers become involved in dangerous races '
          'and criminal activities.');
      expect(movie.ageRating, '12A');
      expect(movie.screeningTime, '1 hour 47 minutes');
      expect(movie.ticketPrice, 10.50);
      expect(movie.imagePath, 'assets/images/1.jpg');
      expect(movie.toJson(), json);
    });

    test('fromJson converts a whole-number price to a double', () {
      final Map<String, dynamic> json = <String, dynamic>{
        'id': 'rocky',
        'title': 'Rocky',
        'synopsis': 'A boxer gets a shot at the title.',
        'ageRating': '15',
        'screeningTime': '2 hours 56 minutes',
        'ticketPrice': 12,
        'imagePath': 'assets/images/2.jpg',
      };

      final Movie movie = Movie.fromJson(json);

      expect(movie.ticketPrice, isA<double>());
      expect(movie.ticketPrice, 12.00);
      expect(movie.formattedPrice, '£12.00');
    });
  });
}
