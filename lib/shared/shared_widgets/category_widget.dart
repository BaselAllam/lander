import 'package:flutter/material.dart';
import 'package:lander/shared/shared_theme/shared_colors.dart';
import 'package:lander/shared/shared_theme/shared_fonts.dart';



class CategoryWidget extends StatefulWidget {

  final Map<String, dynamic> data;

  const CategoryWidget(this.data, {Key? key}) : super(key: key);

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: SharedColors.whiteColor,
              shape: BoxShape.circle
            ),
            child: Icon(widget.data['categoryIcon'], color: SharedColors.redColor, size: 45),
          ),
          Text(widget.data['categoryName'], style: SharedFonts.greyFont),
        ],
      ),
    );
  }
}