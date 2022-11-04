import 'package:flutter/material.dart';
import 'package:lander/shared/shared_theme/shared_colors.dart';
import 'package:lander/shared/shared_theme/shared_fonts.dart';
import 'package:lander/shared/shared_widgets/vertical_apar_widget.dart';



class ResultScreen extends StatefulWidget {
  final String screenTitle;
  const ResultScreen(this.screenTitle, {Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SharedColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Location . ${widget.screenTitle}', style: SharedFonts.greyFont),
            Row(
              children: [
                Icon(Icons.location_on),
                Text('  Cairo  ', style: SharedFonts.blackFont),
                Icon(Icons.arrow_downward),
              ],
            ),
          ],
        ),
        iconTheme: IconThemeData(color: SharedColors.redColor, size: 25.0),
      ),
      body: ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) => VerticalAparWidget(false, false),
      ),
    );
  }
}