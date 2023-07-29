import 'dart:convert';
import 'package:crack_tech/core/constants/constants.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import '../models/movie.dart';

class HomePageController extends GetxController {
  final String _moviesBoxName = 'moviesBox';
  final RxList<Movie> movies = <Movie>[].obs;
  final RxList<String> genresList = <String>[].obs;
  final RxString selectedGenre = ''.obs;

  @override
  void onInit() {
    fetchHomePageData();
    super.onInit();
  }

  int selectedIndex = -1;

  void onClipButtonPressed(int index) {
    if (selectedIndex == index) {
      selectedIndex = -1; // If the same button is clicked again, deselect it
    } else {
      selectedIndex = index;
    }
    update();
  }

  Future<void> fetchHomePageData() async {
    final box = await Hive.openBox<Movie>(_moviesBoxName);

    if (box.isNotEmpty) {
      movies.value = box.values.toList();
    }
    final response = await http.get(Uri.parse(Constant().dataurl));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      genresList.value = List<String>.from(jsonData['genres']);

      final List<Movie> moviesData = List<Movie>.from(
          jsonData['movies'].map((movie) => Movie.fromJson(movie)));

      movies.value = moviesData;

      box.addAll(moviesData);
    } else {
      throw Exception('Failed to load genres and movies');
    }
  }

  Future<void> fetchMoviesByGenre(String genre) async {
    final box = await Hive.openBox<Movie>(_moviesBoxName);
    selectedGenre.value = genre;

    final List<Movie> cachedMovies =
        box.values.where((movie) => movie.genres.contains(genre)).toList();
    if (cachedMovies.isNotEmpty) {
      movies.value = cachedMovies;
      return;
    }

    final response = await http.get(Uri.parse(Constant().dataurl));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<Movie> moviesData = List<Movie>.from(
          jsonData['movies'].map((movie) => Movie.fromJson(movie)));

      final List<Movie> moviesByGenre =
          moviesData.where((movie) => movie.genres.contains(genre)).toList();

      movies.value = moviesByGenre;

      box.addAll(moviesData); // Save the fetched movies to Hive cache
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
