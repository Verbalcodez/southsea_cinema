import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';
import 'package:southsea_cinema/views/home_view.dart';
import 'package:southsea_cinema/views/movie_listing.dart';

void main() {
  group('App smoke tests', () {
    testWidgets('App displays HomeView as home', (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());

      expect(find.byType(HomeView), findsOneWidget);
      expect(find.text('Southsea Cinema & Arts Centre'), findsOneWidget);
    });

    testWidgets('Displays movie cards with booking buttons',
        (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());

      expect(find.text('Fast & Furious'), findsOneWidget);
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
  });
}
