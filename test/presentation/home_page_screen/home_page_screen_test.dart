import 'package:crack_tech/presentation/home_page_screen/home_page_screen.dart';
import 'package:crack_tech/presentation/home_page_screen/widgets/listname_item_widget.dart';
import 'package:crack_tech/presentation/movie_details_screen/movie_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HomePageScreen', () {
    testWidgets('should render the correct title', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: HomePageScreen()));
      expect(find.text('lbl_movieonline'), findsOneWidget);
    });

    testWidgets('should render the correct number of movies',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: HomePageScreen()));
      expect(find.text('0 movies'), findsOneWidget);
    });

    testWidgets('should navigate to movie details screen on movie tap',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(home: HomePageScreen()));
      await tester.tap(find.byType(ListnameItemWidget).first);
      await tester.pumpAndSettle();
      expect(find.byType(MovieDetailsScreen), findsOneWidget);
    });
  });
}
