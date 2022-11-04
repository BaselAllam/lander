import 'package:flutter/material.dart';
import 'package:lander/demo_data.dart';
import 'package:lander/spaces/space_views/result_screen.dart';
import 'package:lander/shared/shared_theme/shared_colors.dart';
import 'package:lander/shared/shared_theme/shared_fonts.dart';
import 'package:lander/shared/shared_widgets/category_widget.dart';
import 'package:lander/shared/shared_widgets/horiz_apar_widget.dart';
import 'package:lander/shared/shared_widgets/vertical_apar_widget.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SharedColors.backGroundColor,
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 25, bottom: 25),
            height: 100.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return CategoryWidget(categories[index]);
              },
            ),
          ),
          customListTile('Recommended'),
          for (int i = 0; i < 3; i++)
          VerticalAparWidget(false, false),
          customListTile('Nearby to you'),
          for (int i = 0; i < 3; i++)
          HorizontalAparWidget()
        ],
      ),
    );
  }

  ListTile customListTile(String title) {
    return ListTile(
      title: Text(title, style: SharedFonts.blackFont),
      trailing: Text('more', style: SharedFonts.greyFont),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => ResultScreen(title)));
      },
    );
  }
}