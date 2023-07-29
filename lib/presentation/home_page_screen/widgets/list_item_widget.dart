import '../controller/home_page_controller.dart';
import '../models/list_item_model.dart';
import 'package:flutter/material.dart';
import 'package:crack_tech/core/app_export.dart';

class ListItemWidget extends StatelessWidget {
  ListItemWidget({
    required this.model,
    required this.isSelected,
    required this.index,
    required this.onGenreSelected,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final String model;

  final Function onGenreSelected;
  final Function onPressed;
  final int index;

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onGenreSelected(model);
          onPressed(index);
        },
        child: SizedBox(
          width: getHorizontalSize(72),
          child: Align(
            alignment: Alignment.centerRight,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              width:
                  isSelected ? getHorizontalSize(100) : getHorizontalSize(72),
              padding: getPadding(left: 9, top: 9, right: 9, bottom: 9),
              decoration: BoxDecoration(
                color: isSelected ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              child: Text(
                model,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ));
  }
}
