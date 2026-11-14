import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/basket_item.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';
import 'package:southsea_cinema/views/basket_view.dart';

const Movie testMovie = Movie(
  id: 'fast-furious',
  title: 'Fast & Furious',
  synopsis: 'Street racing and criminal activity.',
  ageRating: '12A',
  screeningTime: '1 hour 47 minutes',
  ticketPrice: 10.0,
  imagePath: 'assets/images/1.jpg',
);

void main() {
  setUp(() {
    BasketRepository.instance.clear();
  });

  testWidgets('BasketView displays empty message when basket has no items',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: BasketView()));

    expect(find.text('Your basket is empty'), findsOneWidget);
    expect(find.text('Buy tickets'), findsNothing);
  });

  testWidgets(
      'BasketView renders items and removes item when delete pressed',
      (WidgetTester tester) async {
    const BasketItem item = BasketItem(
      movie: testMovie,
      quantity: 2,
    );

    BasketRepository.instance.addItem(item);

    await tester.pumpWidget(const MaterialApp(home: BasketView()));

    expect(find.text('Your basket'), findsOneWidget);
    expect(find.text('2 x Fast & Furious'), findsOneWidget);
    expect(find.text('£20.00'), findsWidgets);
    expect(find.text('Buy tickets'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.delete_outline));
    await tester.pump();

    expect(find.text('Your basket is empty'), findsOneWidget);
  });
}
