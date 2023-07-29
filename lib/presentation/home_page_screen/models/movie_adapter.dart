import 'package:hive/hive.dart';

import 'movie.dart';

class MovieAdapter extends TypeAdapter<Movie> {
  @override
  int get typeId => 0;

  @override
  Movie read(BinaryReader reader) {
    return Movie(
      id: reader.read(),
      title: reader.read(),
      year: reader.read(),
      runtime: reader.read(),
      genres: reader.read(),
      director: reader.read(),
      actors: reader.read(),
      plot: reader.read(),
      posterUrl: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Movie obj) {
    writer.write(obj.id);
    writer.write(obj.title);
    writer.write(obj.year);
    writer.write(obj.runtime);
    writer.write(obj.genres);
    writer.write(obj.director);
    writer.write(obj.actors);
    writer.write(obj.plot);
    writer.write(obj.posterUrl);
  }
}
