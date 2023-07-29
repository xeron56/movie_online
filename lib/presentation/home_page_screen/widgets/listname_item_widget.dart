import 'package:crack_tech/presentation/home_page_screen/models/movie.dart';

import '../controller/home_page_controller.dart';
import '../models/listname_item_model.dart';
import 'package:flutter/material.dart';
import 'package:crack_tech/core/app_export.dart';

// ignore: must_be_immutable
class ListnameItemWidget extends StatelessWidget {
  ListnameItemWidget(
    this.listnameItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Movie listnameItemModelObj;

  var controller = Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: getPadding(
          all: 12,
        ),
        decoration: AppDecoration.outline.copyWith(
          borderRadius: BorderRadiusStyle.circleBorder16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageView(
              url: listnameItemModelObj.posterUrl,
              height: getVerticalSize(
                133,
              ),
              width: getHorizontalSize(
                115,
              ),
              radius: BorderRadius.circular(
                getHorizontalSize(
                  16,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Padding(
                padding: getPadding(
                  left: 16,
                  top: 8,
                  bottom: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        child: Text(
                      listnameItemModelObj.title,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: theme.textTheme.titleMedium,
                    )),
                    Padding(
                      padding: getPadding(
                        top: 8,
                      ),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "lbl_year".tr,
                              style: CustomTextStyles.bodyMediumBluegray500_1,
                            ),
                            TextSpan(
                              text: " ",
                              style: CustomTextStyles.bodyMediumBluegray800_1,
                            ),
                            TextSpan(
                              text: "lbl_1984".tr,
                              style: theme.textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        top: 8,
                      ),
                      child: Text(
                        "lbl_director".tr,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: CustomTextStyles.bodyMediumBluegray500,
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        top: 6,
                      ),
                      child: Text(
                        listnameItemModelObj.director,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
