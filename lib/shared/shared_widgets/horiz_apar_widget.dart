import 'package:flutter/material.dart';
import 'package:lander/shared/shared_theme/shared_colors.dart';
import 'package:lander/shared/shared_theme/shared_fonts.dart';
import 'package:lander/shared/shared_widgets/fav_widget.dart';



class HorizontalAparWidget extends StatefulWidget {
  const HorizontalAparWidget({Key? key}) : super(key: key);

  @override
  State<HorizontalAparWidget> createState() => _HorizontalAparWidgetState();
}

class _HorizontalAparWidgetState extends State<HorizontalAparWidget> {
  @override
  Widget build(BuildContext context) {
    double imgWidth = MediaQuery.of(context).size.width / 3.5;
    return Container(
      margin: const EdgeInsets.all(25.0),
      decoration: BoxDecoration(
        color: SharedColors.whiteColor,
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: Row(
        children: [
          Container(
            width: imgWidth,
            height: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), bottomLeft: Radius.circular(20.0)),
              image: DecorationImage(
                image: NetworkImage('https://imgs.aqarmap.com/wompoo/aqarmap-media/search-thumb/2208/63077aa345bf3715277052.jpg'),
                fit: BoxFit.fill
              )
            ),
            alignment: Alignment.topLeft,
            child: FavWidget(),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width - (imgWidth + 50),
                child: ListTile(
                  title: Text('Duplex Home', style: SharedFonts.blackFont),
                  subtitle: innerRow(Icons.location_on, 'Cairo, Nasr City'),
                  trailing: Text('2000USD\nMonth', textAlign: TextAlign.center, style: SharedFonts.subRedFont)
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 5, 20, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    innerRow(Icons.bed, '3 Beds'),
                    innerRow(Icons.bathroom, '1 Bathroom'),
                    innerRow(Icons.area_chart_outlined, '250 Sqft'),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Row innerRow(IconData icon, String data) {
    return Row(
      children: [
        Icon(icon, color: SharedColors.greyColor, size: 13),
        Text(' $data', style: SharedFonts.subGreyFont)
      ],
    );
  }
}