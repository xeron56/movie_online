import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class Movie extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String year;
  @HiveField(3)
  final String runtime;
  @HiveField(4)
  final List<String> genres;
  @HiveField(5)
  final String director;
  @HiveField(6)
  final String actors;
  @HiveField(7)
  final String plot;
  @HiveField(8)
  final String posterUrl;

  Movie({
    required this.id,
    required this.title,
    required this.year,
    required this.runtime,
    required this.genres,
    required this.director,
    required this.actors,
    required this.plot,
    required this.posterUrl,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      year: json['year'],
      runtime: json['runtime'],
      genres: List<String>.from(json['genres']),
      director: json['director'],
      actors: json['actors'],
      plot: json['plot'],
      posterUrl: json['posterUrl'],
    );
  }
}
