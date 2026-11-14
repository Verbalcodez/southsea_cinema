
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie>? _cachedMovies;

  List<Movie> getMovies() {
    return const [
      Movie(
        id: 'fast-furious',
        title: 'Fast & Furious',
        synopsis:
            'A group of street racers become involved in dangerous races and criminal activities.',
        ageRating: '12A',
        screeningTime: '1 hour 47 minutes',
        ticketPrice: 10.00,
        imagePath: 'assets/images/1.jpg',
      ),
      Movie(
        id: 'rocky',
        title: 'Rocky',
        synopsis:
            'A small-time boxer gets a once-in-a-lifetime chance to fight the heavyweight world champion..',
        ageRating: '15',
        screeningTime: '2 hours 56 minutes',
        ticketPrice: 12.00,
        imagePath: 'assets/images/2.jpg',
      ),
      Movie(
        id: 'creed',
        title: 'Creed',
        synopsis:
            'The son of former heavyweight champion Apollo Creed seeks out Rocky Balboa to train him for his own boxing career.',
        ageRating: '12A',
        screeningTime: '2 hours 13 minutes',
        ticketPrice: 11.00,
        imagePath: 'assets/images/3.jpg',
      ),
    ];
  }

  Movie? getMovieById(String id) {
    for (final movie in getMovies()) {
      if (movie.id == id) {
        return movie;

  Future<List<Movie>> loadMoviesFromAsset({
    String assetPath = 'assets/data/movies.json',
  }) async {
    final String jsonString = await rootBundle.loadString(assetPath);
    final dynamic decodedData = jsonDecode(jsonString);
    final List<dynamic> jsonList = decodedData as List<dynamic>;
    final List<Movie> loadedMovies = [];

    for (final dynamic item in jsonList) {
      final Map<String, dynamic> itemMap = item as Map<String, dynamic>;
      final Movie movie = Movie.fromJson(itemMap);
      loadedMovies.add(movie);
    }

    _cachedMovies = loadedMovies;
    return loadedMovies;
  }
      }
    }
    return null;
  }
}
