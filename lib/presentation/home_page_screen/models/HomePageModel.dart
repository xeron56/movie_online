import 'package:get/get.dart';

import 'list_item_model.dart';
import 'listname_item_model.dart';

class HomePageModel {
  final RxList<ListItemModel> listItemList;
  final RxList<ListnameItemModel> listnameItemList;

  HomePageModel({required this.listItemList, required this.listnameItemList});
}
