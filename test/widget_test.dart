import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';
import 'package:southsea_cinema/views/home_view.dart';

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
  });
}
