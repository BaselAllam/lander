import 'package:flutter/material.dart';
import 'package:lander/shared/shared_theme/shared_colors.dart';
import 'package:lander/shared/shared_widgets/vertical_apar_widget.dart';


class WishlistScreen extends StatefulWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SharedColors.backGroundColor,
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) => VerticalAparWidget(false, false),
      ),
    );
  }
}