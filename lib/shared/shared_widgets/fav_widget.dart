import 'package:flutter/material.dart';
import 'package:lander/shared/shared_theme/shared_colors.dart';


class FavWidget extends StatefulWidget {
  const FavWidget({Key? key}) : super(key: key);

  @override
  State<FavWidget> createState() => _FavWidgetState();
}

class _FavWidgetState extends State<FavWidget> {

  bool isFav = false;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
        color: SharedColors.whiteColor,
        shape: BoxShape.circle
      ),
      child: IconButton(
        icon: Icon(isFav ? Icons.favorite : Icons.favorite_border),
        color: SharedColors.redColor,
        iconSize: 25.0,
        onPressed: () {
          isFav = !isFav;
          setState(() {
            
          });
        },
      ),
    );
  }
}