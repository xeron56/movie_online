import 'package:crack_tech/presentation/home_page_screen/controller/home_page_controller.dart';
import 'package:crack_tech/presentation/home_page_screen/home_page_screen.dart';
import 'package:crack_tech/presentation/home_page_screen/models/movie.dart';
import 'package:crack_tech/presentation/home_page_screen/widgets/list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';

// A mock implementation of the HomePageController
class MockHomePageController extends Mock implements HomePageController {}

void main() {
  // Initialize GetIt and register the mock controller
  setUpAll(() {
    Get.put<HomePageController>(MockHomePageController());
  });

  testWidgets('Test selecting and deselecting genres',
      (WidgetTester tester) async {
    // Mock the genres list and movies list
    List<String> genres = ['Comedy', 'Action', 'Drama'];
    List<Movie> movies = [
      Movie(
        id: 1,
        title: 'The Shawshank Redemption',
        year: "1994",
        runtime: "142",
        genres: ['Drama'],
        director: 'Frank Darabont',
        actors: 'Tim Robbins, Morgan Freeman, Bob Gunton',
        plot:
            'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.',
        posterUrl:
            'https://www.imdb.com/title/tt0111161/mediaviewer/rm3582021376',
      ),
      Movie(
        id: 2,
        title: 'The Godfather',
        year: "1972",
        runtime: "175",
        genres: ['Crime', 'Drama'],
        director: 'Francis Ford Coppola',
        actors: 'Marlon Brando, Al Pacino, James Caan',
        plot:
            'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.',
        posterUrl:
            'https://www.imdb.com/title/tt0068646/mediaviewer/rm3582021376',
      ),
      Movie(
        id: 3,
        title: 'The Dark Knight',
        year: "2008",
        runtime: "152",
        genres: ['Action', 'Crime', 'Drama'],
        director: 'Christopher Nolan',
        actors: 'Christian Bale, Heath Ledger, Aaron Eckhart',
        plot:
            'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.',
        posterUrl:
            'https://www.imdb.com/title/tt0468569/mediaviewer/rm3582021376',
      ),
    ];

    // Mock the controller to return the mocked data
    when(Get.find<HomePageController>().genresList).thenReturn(genres.obs);
    when(Get.find<HomePageController>().movies).thenReturn(movies.obs);

    // Build the widget tree
    await tester.pumpWidget(
      GetMaterialApp(
        home: HomePageScreen(),
      ),
    );

    // Expect three genres in the ListView.separated
    expect(find.byType(ListItemWidget), findsNWidgets(3));
  });
}
