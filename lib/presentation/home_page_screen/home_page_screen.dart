import 'package:crack_tech/presentation/movie_details_screen/movie_details_screen.dart';

import '../home_page_screen/widgets/list_item_widget.dart';
import '../home_page_screen/widgets/listname_item_widget.dart';
import 'controller/home_page_controller.dart';
import 'models/list_item_model.dart';
import 'models/listname_item_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:crack_tech/core/app_export.dart';
import 'package:crack_tech/widgets/app_bar/custom_app_bar.dart';

import 'models/movie.dart';

class HomePageScreen extends GetWidget<HomePageController> {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        appBar: CustomAppBar(
          height: getVerticalSize(92),
          leadingWidth: 38,
          leading: CustomImageView(
            svgPath: ImageConstant.imgMenu01,
            height: getSize(24),
            width: getSize(24),
            margin: getMargin(left: 14, top: 24, bottom: 12),
          ),
          centerTitle: true,
          title: Text(
            "lbl_movieonline".tr,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: CustomTextStyles.titleSmallBlack900,
          ),
          actions: [
            CircleAvatar(
              radius: getSize(17.5),
              backgroundImage: AssetImage(ImageConstant.imgAvatar),
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.transparent,
            ),
          ],
          styleType: Style.bgFill,
        ),
        body: Container(
          width: double.maxFinite,
          padding: getPadding(top: 8, bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: getVerticalSize(36),
                  child: Obx(
                    () => ListView.separated(
                      padding: getPadding(left: 17),
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) {
                        return SizedBox(width: getHorizontalSize(8));
                      },
                      itemCount: controller.genresList.value.length,
                      itemBuilder: (context, index) {
                        String model = controller.genresList.value[index];

                        return ListItemWidget(
                          model: model,
                          onGenreSelected: (genre) {
                            // Fetch movies for the selected genre
                            controller.fetchMoviesByGenre(genre);
                            controller.selectedGenre(genre);
                          },
                          index: index,
                          isSelected: index == controller.selectedIndex,
                          onPressed: controller.onClipButtonPressed,
                        );
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: getPadding(left: 16, top: 17),
                child: Obx(() => Text(
                      "${controller.movies.value.length} ${controller.selectedGenre.value} movies"
                          .tr,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: theme.textTheme.bodyMedium,
                    )),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: getPadding(left: 16, top: 14, right: 16),
                    child: Obx(
                      () => ListView.separated(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return SizedBox(height: getVerticalSize(12));
                        },
                        itemCount: controller.movies.value.length,
                        itemBuilder: (context, index) {
                          Movie model = controller.movies.value[index];
                          return GestureDetector(
                            onTap: () {
                              print("movie: ${controller.movies.value[index]}");
                              Get.to(
                                () => MovieDetailsScreen(
                                    movie: controller.movies.value[index]),
                              );
                            },
                            child: ListnameItemWidget(model),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
