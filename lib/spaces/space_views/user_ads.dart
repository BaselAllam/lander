import 'package:flutter/material.dart';
import 'package:lander/shared/shared_theme/shared_colors.dart';
import 'package:lander/shared/shared_theme/shared_fonts.dart';
import 'package:lander/shared/shared_widgets/vertical_apar_widget.dart';



class UserAds extends StatefulWidget {
  const UserAds({Key? key}) : super(key: key);

  @override
  State<UserAds> createState() => _UserAdsState();
}

class _UserAdsState extends State<UserAds> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SharedColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('My Spaces', style: SharedFonts.blackFont),
        iconTheme: IconThemeData(color: SharedColors.redColor, size: 25.0),
      ),
      body: ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) => VerticalAparWidget(true, false),
      ),
    );
  }
}