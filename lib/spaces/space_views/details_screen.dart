import 'package:flutter/material.dart';
import 'package:lander/shared/shared_theme/shared_colors.dart';
import 'package:lander/shared/shared_theme/shared_fonts.dart';
import 'package:lander/shared/shared_widgets/vertical_apar_widget.dart';



class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: SharedColors.redColor, size: 20.0),
        title: Text('Details', style: SharedFonts.blackFont),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: SharedColors.backGroundColor,
      floatingActionButton: InkWell(
        onTap: () {},
        child: Container(
          height: 50.0,
          width: MediaQuery.of(context).size.width/ 1.2,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: SharedColors.redColor,
          ),
          alignment: Alignment.center,
          child: Text('Rent Now', style: SharedFonts.whiteFont),
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            VerticalAparWidget(false, true),
            ListTile(
              title: Text('Description', style: SharedFonts.blackFont),
              subtitle: Text('''Description DescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescription
              Description DescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescription
              Description DescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescription
              Description DescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescription
              ''', style: SharedFonts.greyFont),
            ),
            ListTile(
              title: Text('Gallery', style: SharedFonts.blackFont),
            ),
            Container(
              height: 100.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) => Container(
                  width: 100.0,
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: NetworkImage('https://imgs.aqarmap.com/wompoo/aqarmap-media/search-thumb/2208/63077aa345bf3715277052.jpg'),
                      fit: BoxFit.fill
                    )
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}