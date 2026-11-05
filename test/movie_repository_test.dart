import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';

void main() {
  group('MovieRepository unit tests', () {
    test('getMovies returns three movies', () {
      final MovieRepository repository = MovieRepository();
      final List<Movie> movies = repository.getMovies();

      expect(movies.length, 3);
    });

    test('getMovies contains valid films', () {
      final MovieRepository repository = MovieRepository();
      final List<Movie> movies = repository.getMovies();

      final Movie fastFurious = movies[0];
      expect(fastFurious.id, 'fast-furious');
      expect(fastFurious.title, 'Fast & Furious');
      expect(fastFurious.ticketPrice, 10.00);
      expect(fastFurious.imagePath, isNotEmpty);

      final Movie rocky = movies[1];
      expect(rocky.id, 'rocky');
      expect(rocky.title, 'Rocky');
      expect(rocky.ticketPrice, 12.00);
      expect(rocky.imagePath, isNotEmpty);

      final Movie creed = movies[2];
      expect(creed.id, 'creed');
      expect(creed.title, 'Creed');
      expect(creed.ticketPrice, 11.00);
      expect(creed.imagePath, isNotEmpty);
    });

    test('getMovieById returns matching movie when id exists', () {
      final MovieRepository repository = MovieRepository();
      final Movie? movie = repository.getMovieById('rocky');

      expect(movie, isNotNull);
      expect(movie?.title, 'Rocky');
      expect(movie?.ticketPrice, 12.00);
    });

    test('getMovieById returns null when id does not exist', () {
      final MovieRepository repository = MovieRepository();
      final Movie? movie = repository.getMovieById('non-existent');

      expect(movie, isNull);
    });
  });
}
