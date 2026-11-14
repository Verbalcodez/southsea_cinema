import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/basket_item.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';

const Movie testMovie1 = Movie(
  id: 'fast-furious',
  title: 'Fast & Furious',
  synopsis: 'Street racing and criminal activity.',
  ageRating: '12A',
  screeningTime: '1 hour 47 minutes',
  ticketPrice: 10.0,
  imagePath: 'assets/images/1.jpg',
);

const Movie testMovie2 = Movie(
  id: 'rocky',
  title: 'Rocky',
  synopsis: 'A small-time boxer gets a shot at the title.',
  ageRating: '15',
  screeningTime: '2 hours 56 minutes',
  ticketPrice: 12.0,
  imagePath: 'assets/images/2.jpg',
);

void main() {
  setUp(() {
    BasketRepository.instance.clear();
  });

  group('BasketRepository tests', () {
    test('starts with empty basket and zero totals', () {
      final BasketRepository basket = BasketRepository.instance;

      expect(basket.getItems().length, 0);
      expect(basket.getTotalItems(), 0);
      expect(basket.totalItemCount, 0);
      expect(basket.getTotal(), 0.0);
    });

    test('adds items and calculates total correctly', () {
      final BasketRepository basket = BasketRepository.instance;

      const BasketItem item1 = BasketItem(
        movie: testMovie1,
        quantity: 2,
      );
      const BasketItem item2 = BasketItem(
        movie: testMovie2,
        quantity: 1,
      );

      basket.addItem(item1);
      basket.addItem(item2);

      expect(basket.getItems().length, 2);
      expect(basket.getTotalItems(), 3);
      expect(basket.totalItemCount, 3);
      expect(basket.getTotal(), 32.0);
    });

    test('removes items correctly', () {
      final BasketRepository basket = BasketRepository.instance;

      const BasketItem item = BasketItem(
        movie: testMovie1,
        quantity: 1,
      );

      basket.addItem(item);
      expect(basket.getItems().length, 1);

      basket.removeItem(0);

      expect(basket.getItems().length, 0);
      expect(basket.getTotal(), 0.0);
    });

    test('clear empties the basket', () {
      final BasketRepository basket = BasketRepository.instance;

      const BasketItem item = BasketItem(
        movie: testMovie1,
        quantity: 2,
      );

      basket.addItem(item);
      basket.clear();

      expect(basket.getItems().length, 0);
      expect(basket.getTotalItems(), 0);
      expect(basket.getTotal(), 0.0);
    });
  });
}
