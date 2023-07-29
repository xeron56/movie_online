import 'package:crack_tech/core/app_export.dart';

class SplashScreenController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.offNamed(
        AppRoutes.homePageScreen,
      );
    });
  }
}
