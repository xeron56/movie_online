import 'package:crack_tech/core/app_export.dart';
import 'package:crack_tech/presentation/movie_details_screen/models/movie_details_model.dart';

/// A controller class for the MovieDetailsScreen.
///
/// This class manages the state of the MovieDetailsScreen, including the
/// current movieDetailsModelObj
class MovieDetailsController extends GetxController {
  Rx<MovieDetailsModel> movieDetailsModelObj = MovieDetailsModel().obs;
}
