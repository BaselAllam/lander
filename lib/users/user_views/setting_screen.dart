import 'package:flutter/material.dart';
import 'package:lander/shared/shared_theme/shared_colors.dart';
import 'package:lander/shared/shared_theme/shared_fonts.dart';



class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SharedColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.close),
          color: SharedColors.redColor,
          iconSize: 25.0,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Setting', style: SharedFonts.blackFont),
      ),
      body: ListView(
        children: [
          settingSectionItem(Icons.language, 'Change Language', 'English'),
          settingSectionItem(Icons.notifications_active, 'Push Notification', 'On'),
          settingSectionItem(Icons.app_settings_alt, 'App Version', '1.0.0+1'),
        ],
      ),
    );
  }

  Container settingSectionItem(IconData icon, String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: SharedColors.whiteColor,
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: ListTile(
        leading: Icon(icon, color: SharedColors.redColor, size: 20.0),
        title: Text(title, style: SharedFonts.blackFont),
        subtitle: Text(subtitle, style: SharedFonts.greyFont),
        trailing: Icon(Icons.arrow_forward_ios, color: SharedColors.greyColor, size: 20.0),
        onTap: () {
          
        },
      ),
    );
  }
}