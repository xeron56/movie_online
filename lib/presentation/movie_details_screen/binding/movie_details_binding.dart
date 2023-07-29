import '../controller/movie_details_controller.dart';
import 'package:get/get.dart';

/// A binding class for the MovieDetailsScreen.
///
/// This class ensures that the MovieDetailsController is created when the
/// MovieDetailsScreen is first loaded.
class MovieDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MovieDetailsController());
  }
}
