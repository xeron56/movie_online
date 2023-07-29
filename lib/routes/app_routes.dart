import 'package:crack_tech/presentation/home_page_screen/home_page_screen.dart';
import 'package:crack_tech/presentation/home_page_screen/binding/home_page_binding.dart';
import 'package:crack_tech/presentation/movie_details_screen/movie_details_screen.dart';
import 'package:crack_tech/presentation/movie_details_screen/binding/movie_details_binding.dart';
import 'package:crack_tech/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:crack_tech/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:crack_tech/presentation/splash_screen/binding/splash_screen_binding.dart';
import 'package:crack_tech/presentation/splash_screen/splash.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String homePageScreen = '/home_page_screen';

  static const String movieDetailsScreen = '/movie_details_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: homePageScreen,
      page: () => HomePageScreen(),
      bindings: [
        HomePageBinding(),
      ],
    ),
    GetPage(
      name: movieDetailsScreen,
      page: () => MovieDetailsScreen(movie: Get.arguments),
      bindings: [
        MovieDetailsBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => SplashScreen(),
      bindings: [
        SplashScreenBinding(),
      ],
    )
  ];
}
