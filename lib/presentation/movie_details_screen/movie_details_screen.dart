import 'package:crack_tech/presentation/home_page_screen/models/movie.dart';

import 'controller/movie_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:crack_tech/core/app_export.dart';
import 'package:crack_tech/widgets/custom_icon_button.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({required this.movie, Key? key}) : super(key: key);

  final Movie movie;

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.whiteA700,
            body: Container(
                width: double.maxFinite,
                padding: getPadding(bottom: 29),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          height: getVerticalSize(362),
                          width: double.maxFinite,
                          decoration: AppDecoration.fill1,
                          child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                CustomImageView(
                                    url: widget.movie.posterUrl,
                                    height: getSize(360),
                                    width: mediaQueryData.size.width,
                                    alignment: Alignment.center),
                                CustomIconButton(
                                    height: 40,
                                    width: 40,
                                    margin: getMargin(left: 16, top: 16),
                                    padding: getPadding(all: 8),
                                    alignment: Alignment.topLeft,
                                    onTap: () {
                                      onTapBtnArrowleft();
                                    },
                                    child: CustomImageView(
                                        svgPath: ImageConstant.imgArrowleft))
                              ])),
                      Padding(
                        padding: getPadding(left: 16, top: 13),
                        child: Wrap(
                          children: List.generate(
                            widget.movie.genres.length,
                            (index) => Container(
                              width: getHorizontalSize(72),
                              padding: getPadding(
                                  left: 10, top: 9, right: 10, bottom: 9),
                              decoration: AppDecoration.txtOutline1.copyWith(
                                borderRadius:
                                    BorderRadiusStyle.txtCircleBorder18,
                              ),
                              child: Text(
                                widget.movie.genres[index],
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: theme.textTheme.titleSmall,
                              ),
                            ),
                          ).toList(),
                        ),
                      ),
                      Padding(
                          padding: getPadding(left: 16, top: 13),
                          child: Text(
                              //"lbl_the_cotton_club".tr,
                              widget.movie.title,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: theme.textTheme.headlineLarge)),
                      Padding(
                          padding: getPadding(left: 16, top: 7),
                          child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "lbl_year".tr,
                                    style: CustomTextStyles
                                        .bodyMediumBluegray500_1),
                                TextSpan(
                                    text: " ",
                                    style: CustomTextStyles
                                        .bodyMediumBluegray800_1),
                                TextSpan(
                                    text: widget.movie.year,
                                    style: theme.textTheme.bodyMedium)
                              ]),
                              textAlign: TextAlign.left)),
                      Padding(
                          padding: getPadding(left: 16, top: 12),
                          child: Text("lbl_director".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: CustomTextStyles.titleMediumGray900)),
                      Padding(
                          padding: getPadding(left: 16, top: 7),
                          child: Text(widget.movie.director,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: theme.textTheme.bodyMedium)),
                      Padding(
                          padding: getPadding(left: 16, top: 13),
                          child: Text("lbl_actors".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: CustomTextStyles.titleMediumGray900)),
                      Container(
                          width: getHorizontalSize(273),
                          margin: getMargin(left: 16, top: 5, right: 70),
                          child: Text(widget.movie.actors,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: theme.textTheme.bodyMedium)),
                      Padding(
                          padding: getPadding(left: 16, top: 16),
                          child: Text("lbl_plot".tr,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: CustomTextStyles.titleMediumGray900)),
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              width: getHorizontalSize(320),
                              margin: getMargin(left: 16, top: 5, right: 23),
                              child: Text(widget.movie.plot,
                                  maxLines: 4,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: theme.textTheme.bodyMedium)))
                    ]))));
  }

  /// Navigates to the previous screen.
  ///
  /// When the action is triggered, this function uses the [Get] library to
  /// navigate to the previous screen in the navigation stack.
  onTapBtnArrowleft() {
    Get.back();
  }
}
