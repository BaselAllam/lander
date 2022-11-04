import 'package:flutter/material.dart';
import 'package:lander/spaces/space_views/details_screen.dart';
import 'package:lander/shared/shared_theme/shared_colors.dart';
import 'package:lander/shared/shared_theme/shared_fonts.dart';
import 'package:lander/shared/shared_widgets/fav_widget.dart';



class VerticalAparWidget extends StatefulWidget {
  final bool isEditable;
  final bool isDetails;
  const VerticalAparWidget(this.isEditable, this.isDetails, {Key? key}) : super(key: key);

  @override
  State<VerticalAparWidget> createState() => _VerticalAparWidgetState();
}

class _VerticalAparWidgetState extends State<VerticalAparWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.isDetails ? () {} : () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => DetailsScreen()));
      },
      child: Container(
        margin: EdgeInsets.all(widget.isDetails ? 5.0 : 25.0),
        decoration: BoxDecoration(
          color: widget.isDetails ? Colors.transparent : SharedColors.whiteColor,
          borderRadius: BorderRadius.circular(20.0)
        ),
        child: Column(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
                image: DecorationImage(
                  image: NetworkImage('https://imgs.aqarmap.com/wompoo/aqarmap-media/search-thumb/2208/63077aa345bf3715277052.jpg'),
                  fit: BoxFit.fill
                )
              ),
              alignment: Alignment.topRight,
              child: widget.isEditable ? Container(
                margin: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  color: SharedColors.whiteColor,
                  shape: BoxShape.circle
                ),
                child: IconButton(
                  icon: Icon(Icons.edit),
                  color: SharedColors.redColor,
                  iconSize: 20.0,
                  onPressed: () {},
                ),
              ) :
                FavWidget()
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 20, 20, 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Duplex Home', style: SharedFonts.blackFont),
                  Text('2000USD/Month', style: SharedFonts.redFont)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: innerRow(Icons.location_on, 'Cairo, Nasr City')
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
        ),
      ),
    );
  }

  Row innerRow(IconData icon, String data) {
    return Row(
      children: [
        Icon(icon, color: SharedColors.greyColor, size: 15),
        Text('  $data', style: SharedFonts.greyFont)
      ],
    );
  }
}