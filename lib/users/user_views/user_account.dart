import 'package:flutter/material.dart';
import 'package:lander/spaces/space_views/listspace_screen.dart';
import 'package:lander/shared/shared_theme/shared_colors.dart';
import 'package:lander/shared/shared_theme/shared_fonts.dart';
import 'package:lander/users/user_views/aboutus_screen.dart';
import 'package:lander/users/user_views/contactus_screen.dart';
import 'package:lander/users/user_views/feedback_screen.dart';
import 'package:lander/users/user_views/privacy_screen.dart';
import 'package:lander/users/user_views/setting_screen.dart';
import 'package:lander/spaces/space_views/user_ads.dart';


class UserAccount extends StatefulWidget {
  const UserAccount({Key? key}) : super(key: key);

  @override
  State<UserAccount> createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {

  final List<Map<String, dynamic>> sectionItemData = [
    {
      'icon' : Icons.add,
      'title' : 'List your Space',
      'subtitle' : 'List your space',
      'screen' : ListSpaceScreen()
    },
    {
      'icon' : Icons.list,
      'title' : 'Your Listed Spaces',
      'subtitle' : 'Your Listed Spaces',
      'screen' : UserAds()
    },
    {
      'icon' : Icons.settings,
      'title' : 'Setting',
      'subtitle' : 'Edit your app Setting',
      'screen' : SettingScreen()
    },
    {
      'icon' : Icons.info_outline,
      'title' : 'About us',
      'subtitle' : 'Read our about, terms & condition',
      'screen' : AboutScreen()
    },
    {
      'icon' : Icons.lock,
      'title' : 'Privacy',
      'subtitle' : 'Your data privacy',
      'screen' : PrivacyScreen()
    },
    {
      'icon' : Icons.rate_review,
      'title' : 'Give us Feedback',
      'subtitle' : 'Rate our Services',
      'screen' : FeedbackScreen()
    },
    {
      'icon' : Icons.email,
      'title' : 'Contact Us',
      'subtitle' : 'Send us a message',
      'screen' : ContactusScreen()
    },
  ];

  @override
  Widget build(BuildContext context) {
    double imgWidth = MediaQuery.of(context).size.width / 3.5;
    return Scaffold(
      backgroundColor: SharedColors.backGroundColor,
      body: ListView(
        children: [
          userHeader(imgWidth),
          for (Map i in sectionItemData)
          userSectionItem(i['icon'], i['title'], i['subtitle'], i['screen']),
        ],
      ),
    );
  }

  Container userHeader(double imgWidth) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: SharedColors.whiteColor
      ),
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Container(
            width: imgWidth,
            height: 130.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage('https://avatars.githubusercontent.com/u/44323531?v=4'),
                fit: BoxFit.fill
              )
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width - (imgWidth + 40),
            child: ListTile(
              title: Text('Welcome Adam', style: TextStyle(color: SharedColors.blackColor, fontSize: 20, fontWeight: FontWeight.bold)),
              subtitle: Text('Edit Profile Data', style: SharedFonts.greyFont),
              trailing: IconButton(
                icon: Icon(Icons.logout),
                color: SharedColors.redColor,
                iconSize: 25,
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
  }

  Container userSectionItem(IconData icon, String title, String subtitle, Widget screen) {
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
          // Navigator.pushNamed(context, 'aboutUs');
          Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
        },
      ),
    );
  }
}