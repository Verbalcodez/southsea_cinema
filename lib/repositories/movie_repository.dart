
import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
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
}
