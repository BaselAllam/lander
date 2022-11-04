import 'package:flutter/material.dart';
import 'package:lander/spaces/space_views/home_page.dart';
import 'package:lander/spaces/space_views/map_screen.dart';
import 'package:lander/spaces/space_views/wishlist_screen.dart';
import 'package:lander/shared/shared_theme/shared_colors.dart';
import 'package:lander/shared/shared_theme/shared_fonts.dart';
import 'package:lander/users/user_views/notification_screen.dart';
import 'package:lander/users/user_views/user_account.dart';


class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

  List<Widget> screens = [HomePage(), WishlistScreen(), MapScreen(), NotificationScreen(), UserAccount()];
  int currentScreen = 0;

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
            Text('Location', style: SharedFonts.greyFont),
            Row(
              children: [
                Icon(Icons.location_on, color: SharedColors.redColor, size: 20),
                Text('  Cairo  ', style: SharedFonts.blackFont),
                Icon(Icons.arrow_downward, color: SharedColors.redColor, size: 20),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        backgroundColor: SharedColors.backGroundColor,
        currentIndex: currentScreen,
        elevation: 0.0,
        selectedIconTheme: IconThemeData(color: SharedColors.redColor, size: 25.0),
        unselectedIconTheme: IconThemeData(color: SharedColors.greyColor, size: 17.0),
        selectedLabelStyle: SharedFonts.subBlackFont,
        unselectedLabelStyle: SharedFonts.subGreyFont,
        selectedItemColor: SharedColors.redColor,
        unselectedItemColor: SharedColors.greyColor,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          currentScreen = index;
          setState(() {
            
          });
        },
      ),
      body: screens[currentScreen],
    );
  }
}