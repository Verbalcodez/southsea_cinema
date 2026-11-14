import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';
import 'package:southsea_cinema/views/home_view.dart';
import 'package:southsea_cinema/views/movie_listing.dart';

void main() {
  setUp(() {
    rootBundle.clear();
    BasketRepository.instance.clear();
  });

  group('App smoke tests', () {
    testWidgets('App displays HomeView as home', (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());
      await tester.pumpAndSettle();

      expect(find.byType(HomeView), findsOneWidget);
      expect(find.text('Southsea Cinema & Arts Centre'), findsOneWidget);
    });

    testWidgets('Displays movie cards with booking buttons',
        (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());
      await tester.pumpAndSettle();

      expect(find.text('Fast & Furious'), findsOneWidget);
      await tester.pumpAndSettle();
      expect(find.text('Rocky'), findsOneWidget);
      expect(find.text('Book now'), findsAtLeastNWidgets(2));
    });

    testWidgets('Tapping Book now navigates to MovieListing and adds order',
        (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());

      await tester.tap(find.text('Book now').first);
      await tester.pumpAndSettle();

      expect(find.byType(MovieListing), findsOneWidget);
      expect(find.text('Fast & Furious (12A)'), findsOneWidget);
      expect(find.text('Tickets (£10.00 each):'), findsOneWidget);

      await tester.tap(find.text('Add to order'));
      await tester.pump();

      expect(find.text('1 ticket(s) added to your order.'), findsOneWidget);

      await tester.pageBack();
      await tester.pumpAndSettle();

      expect(find.byType(HomeView), findsOneWidget);

      await tester.tap(find.text('Book now').at(1));
      await tester.pumpAndSettle();

      expect(find.byType(MovieListing), findsOneWidget);
      expect(find.text('Rocky (15)'), findsOneWidget);
      expect(find.text('Tickets (£12.00 each):'), findsOneWidget);
      expect(find.text('1 ticket(s) added to your order.'), findsNothing);
    });

    testWidgets('Booking flow: add tickets, remove from basket and checkout',
        (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());
      await tester.pumpAndSettle();

      // Add tickets for a film loaded from the JSON asset.
      await tester.tap(find.text('Book now').first);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Add to order'));
      await tester.pump();

      expect(find.text('1 ticket(s) added to your order.'), findsOneWidget);

      // Open the drawer and go to My Basket.
      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();
      await tester.tap(find.text('My Basket'));
      await tester.pumpAndSettle();

      expect(find.text('Your basket'), findsOneWidget);
      expect(find.text('1 x Fast & Furious'), findsOneWidget);
      expect(find.text('£10.00'), findsWidgets);

      // Remove the item; the basket returns to its empty state.
      await tester.tap(find.byIcon(Icons.delete_outline));
      await tester.pump();

      expect(find.text('Your basket is empty'), findsOneWidget);

      // Add the same film again and complete the temporary checkout.
      await tester.pageBack();
      await tester.pumpAndSettle();
      await tester.pageBack();
      await tester.pumpAndSettle();

      await tester.tap(find.text('Book now').first);
      await tester.pumpAndSettle();
      await tester.tap(find.text('Add to order'));
      await tester.pump();

      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();
      await tester.tap(find.text('My Basket'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Buy tickets'));
      await tester.pump();

      expect(find.text('Your basket is empty'), findsOneWidget);
      expect(find.text('Thanks, your tickets are confirmed'), findsOneWidget);
      expect(BasketRepository.instance.getItems(), isEmpty);
    });
  });
}
