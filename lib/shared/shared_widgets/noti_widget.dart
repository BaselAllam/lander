import 'package:flutter/material.dart';
import 'package:lander/shared/shared_theme/shared_colors.dart';
import 'package:lander/shared/shared_theme/shared_fonts.dart';


class NotiWidget extends StatefulWidget {
  const NotiWidget({Key? key}) : super(key: key);

  @override
  State<NotiWidget> createState() => _NotiWidgetState();
}

class _NotiWidgetState extends State<NotiWidget> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: const Key(''),
      background: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: SharedColors.redColor,
          borderRadius: BorderRadius.circular(10.0)
        ),
        alignment: Alignment.center,
        child: Text(
          'Marked as read!',
          style: TextStyle(color: SharedColors.whiteColor, fontSize: 20.0),
        )
      ),
      child: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: SharedColors.whiteColor,
          borderRadius: BorderRadius.circular(10.0)
        ),
        child: ListTile(
          title: Text('Notification Name', style: SharedFonts.blackFont),
          subtitle: Text('Notification Description', style: SharedFonts.greyFont),
          trailing: Text('12/Dec/2022', style: SharedFonts.redFont),
        ),
      ),
      onDismissed: (direction) {
        
      },
    );
  }
}