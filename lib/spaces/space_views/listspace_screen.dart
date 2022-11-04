import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lander/shared/shared_theme/shared_colors.dart';
import 'package:lander/shared/shared_theme/shared_fonts.dart';
import 'package:lander/shared/shared_widgets/field_components.dart';
import 'dart:io';

enum AdType {sell, rent}
enum RentType {year, month, quarter, half}

class ListSpaceScreen extends StatefulWidget {
  const ListSpaceScreen({Key? key}) : super(key: key);

  @override
  State<ListSpaceScreen> createState() => _ListSpaceScreenState();
}

class _ListSpaceScreenState extends State<ListSpaceScreen> {
  
  TextEditingController adNameController = TextEditingController();
  TextEditingController adDescriptionController = TextEditingController();
  TextEditingController numberOfBedsController = TextEditingController();
  TextEditingController numberOfBathController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  bool isButtonEnabled = false;
  String adType = '';
  String rentType = '';

  File? pickedImage;

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
        title: Text('List Space', style: SharedFonts.blackFont),
      ),
      body: Center(
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(10.0),
              height: 200.0,
              decoration: BoxDecoration(
                color: SharedColors.greyColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20.0),
                image: pickedImage == null ? DecorationImage(
                  image: AssetImage('assets/images/noimage.jpg'),
                  fit: BoxFit.fill
                ) : DecorationImage(
                  image: FileImage(pickedImage!),
                  fit: BoxFit.fill
                )
              ),
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.camera),
                    color: SharedColors.blueColor,
                    iconSize: 55.0,
                    onPressed: () {
                      imagePick(ImageSource.camera);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.photo_album_outlined),
                    color: SharedColors.blueColor,
                    iconSize: 55.0,
                    onPressed: () {
                      imagePick(ImageSource.gallery);
                    },
                  ),
                ],
              )
            ),
            field('Ads Name', Icons.abc, adNameController, TextInputType.name),
            field('Ads Description', Icons.abc, adDescriptionController, TextInputType.name),
            field('Number of Beds', Icons.bed, numberOfBedsController, TextInputType.number),
            field('Number of Bath', Icons.bathroom, numberOfBathController, TextInputType.number),
            field('Area in SQFT', Icons.area_chart, areaController, TextInputType.number),
            field('Price', Icons.money, priceController, TextInputType.number),
            ListTile(
              title: Text('Ad Type', style: SharedFonts.blackFont),
              subtitle: Text(adType, style: SharedFonts.greyFont),
              trailing: PopupMenuButton(
                icon: Icon(Icons.arrow_downward),
                color: SharedColors.whiteColor,
                iconSize: 20.0,
                initialValue: AdType.sell.name,
                itemBuilder: (BuildContext context) {
                  return <PopupMenuEntry<String>>[
                    PopupMenuItem(
                      child: Text('Sell', style: SharedFonts.greyFont),
                      value: AdType.sell.name,
                    ),
                    PopupMenuItem(
                      child: Text('Rent', style: SharedFonts.greyFont),
                      value: AdType.rent.name,
                    ),
                  ];
                },
                onSelected: (x) {
                  setState(() {
                    adType = x.toString();
                  });
                },
              ),
            ),
            adType == 'rent' ?
            ListTile(
              title: Text('Rent Type', style: SharedFonts.blackFont),
              subtitle: Text(rentType, style: SharedFonts.greyFont),
              trailing: PopupMenuButton(
                icon: Icon(Icons.arrow_downward),
                color: SharedColors.whiteColor,
                iconSize: 20.0,
                initialValue: RentType.month.name,
                itemBuilder: (BuildContext context) {
                  return <PopupMenuEntry<String>>[
                    PopupMenuItem(
                      child: Text('Monthly', style: SharedFonts.greyFont),
                      value: RentType.month.name,
                    ),
                    PopupMenuItem(
                      child: Text('Yearly', style: SharedFonts.greyFont),
                      value: RentType.year.name,
                    ),
                    PopupMenuItem(
                      child: Text('Quarter', style: SharedFonts.greyFont),
                      value: RentType.quarter.name,
                    ),
                    PopupMenuItem(
                      child: Text('Half Year', style: SharedFonts.greyFont),
                      value: RentType.half.name,
                    ),
                  ];
                },
                onSelected: (x) {
                  setState(() {
                    rentType = x.toString();
                  });
                },
              ),
            ) : SizedBox(),
            ListTile(
              title: Text('Read Terms & Conditions', style: SharedFonts.blackFont),
              trailing: Icon(Icons.security, color: SharedColors.greyColor, size: 20.0),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  backgroundColor: SharedColors.whiteColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                  builder: (BuildContext context) {
                    return Container(
                      padding: EdgeInsets.all(10.0),
                      child: ListTile(
                        title: Text('Our Terms & Conditions', style: SharedFonts.blackFont),
                        subtitle: Text('''lets read our terms & conditions
                        lets read our terms & conditionslets read our terms & conditions
                        lets read our terms & conditions
                        lets read our terms & conditions
                        lets read our terms & conditions
                        lets read our terms & conditions
                        ''', style: SharedFonts.greyFont),
                      ),
                    );
                  }
                );
              }
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Column(
                children: [
                  TextButton(
                    child: Text('Submit Ad', style: SharedFonts.whiteFont),
                    style: TextButton.styleFrom(
                      backgroundColor: isButtonEnabled ? SharedColors.redColor : SharedColors.greyColor,
                      elevation: 0.0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                      maximumSize: Size(200.0, 50.0),
                      minimumSize: Size(200.0, 50.0),
                    ),
                    onPressed: isButtonEnabled ? () {
                      if (adNameController.text.isEmpty || numberOfBedsController.text.isEmpty || adDescriptionController.text.isEmpty ||
                          numberOfBathController.text.isEmpty || areaController.text.isEmpty || 
                          priceController.text.isEmpty || adType.isEmpty
                      ) {
                        ScaffoldMessenger.of(context).showSnackBar(snack('Some Fields Required!', SharedColors.redColor));
                      } else {
                        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => BottomNavigation()));
                      }
                    } : () {}
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding field(String label, IconData icon, TextEditingController controller, TextInputType type) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
        decoration: InputDecoration(
          border: border(SharedColors.greyColor),
          enabledBorder: border(SharedColors.greyColor),
          focusedBorder: border(SharedColors.greyColor),
          errorBorder: border(SharedColors.redColor),
          labelText: label,
          labelStyle: SharedFonts.greyFont,
          prefixIcon: Icon(icon, color: SharedColors.greyColor, size: 20.0),
        ),
        textInputAction: TextInputAction.done,
        keyboardType: type,
        controller: controller,
        onChanged: (x) => validateField(),
      ),
    );
  }

  validateField() {
    if (
      adNameController.text.isNotEmpty && numberOfBedsController.text.isNotEmpty && adDescriptionController.text.isNotEmpty &&
      numberOfBathController.text.isNotEmpty && areaController.text.isNotEmpty && 
      priceController.text.isNotEmpty && adType.isNotEmpty
      ) {
      isButtonEnabled = true;
    } else {
      isButtonEnabled = false;
    }
    setState(() {});
  }

  void imagePick(ImageSource source) async {
    try {
      XFile? picked = await ImagePicker().pickImage(source: source);
      setState(() {
        pickedImage = File(picked!.path);
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(snack('No Image Picked', SharedColors.redColor));
    }
  }
}