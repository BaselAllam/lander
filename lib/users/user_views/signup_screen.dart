import 'package:flutter/material.dart';
import 'package:lander/shared/shared_theme/shared_colors.dart';
import 'package:lander/shared/shared_theme/shared_fonts.dart';
import 'package:lander/shared/shared_widgets/field_components.dart';
import 'package:lander/users/user_logic/user_model.dart';
import 'package:lander/users/user_views/bottom_navigation.dart';


enum FieldType {password, userName, email}


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  bool isSecure = true;
  bool isButtonEnabled = false;
  String selectedGender = '';
  DateTime? date = DateTime(2002);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SharedColors.backGroundColor,
      body: Center(
        child: ListView(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Text('\nWelcome! Register\n', style: TextStyle(color: SharedColors.blackColor, fontSize: 45.0, fontWeight: FontWeight.bold)),
            ),
            field('Email Address', Icons.email, false, emailController, FieldType.email),
            field('User Name', Icons.person, false, userNameController, FieldType.userName),
            field('Password', Icons.lock, isSecure, passwordController, FieldType.password),
            field('Confirm Password', Icons.lock, isSecure, confirmPasswordController, FieldType.password),
            ListTile(
              title: Text('Gender', style: SharedFonts.blackFont),
              subtitle: Text(selectedGender, style: SharedFonts.greyFont),
              trailing: PopupMenuButton(
                icon: Icon(Icons.arrow_downward),
                color: SharedColors.whiteColor,
                iconSize: 20.0,
                initialValue: UserGender.male.name,
                itemBuilder: (BuildContext context) {
                  return <PopupMenuEntry<String>>[
                    PopupMenuItem(
                      child: Text('Male', style: SharedFonts.greyFont),
                      value: UserGender.male.name,
                    ),
                    PopupMenuItem(
                      child: Text('FeMale', style: SharedFonts.greyFont),
                      value: UserGender.female.name,
                    ),
                  ];
                },
                onSelected: (x) {
                  setState(() {
                    selectedGender = x.toString();
                  });
                },
              ),
            ),
            ListTile(
              title: Text('BirthDate', style: SharedFonts.blackFont),
              subtitle: Text(date.toString().substring(0, 10), style: SharedFonts.greyFont),
              trailing: Icon(Icons.calendar_month, color: SharedColors.greyColor, size: 20.0),
              onTap: () async {
                DateTime? x = await showDatePicker(
                  context: context,
                  firstDate: DateTime(2002),
                  lastDate: DateTime(2010),
                  initialDate: DateTime(2010),
                );
                setState(() {
                  date = x;
                });
              }
            ),
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
            Column(
              children: [
                TextButton(
                  child: Text('Register', style: SharedFonts.whiteFont),
                  style: TextButton.styleFrom(
                    backgroundColor: isButtonEnabled ? SharedColors.redColor : SharedColors.greyColor,
                    elevation: 0.0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                    maximumSize: Size(200.0, 50.0),
                    minimumSize: Size(200.0, 50.0),
                  ),
                  onPressed: isButtonEnabled ? () {
                    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(snack('Some Fields Required!', SharedColors.redColor));
                    } else {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => BottomNavigation()));
                    }
                  } : () {}
                ),
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text('\n Have an account? ... login\n', style: SharedFonts.redFont),
              )
            ),
          ],
        ),
      ),
    );
  }

  Padding field(String label, IconData icon, bool secure, TextEditingController controller, FieldType fieldType) {
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
          suffixIcon: fieldType == FieldType.password ? IconButton(
            icon: Icon(isSecure ? Icons.visibility : Icons.visibility_off),
            color: SharedColors.greyColor,
            iconSize: 20.0,
            onPressed: () {
              setState(() {
                isSecure = !isSecure;
              });
            },
          ) : SizedBox()
        ),
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.emailAddress,
        obscureText: secure,
        controller: controller,
        onChanged: (x) => validateField(),
      ),
    );
  }
  
  validateField() {
    if (
      emailController.text.isNotEmpty && passwordController.text.isNotEmpty &&
      confirmPasswordController.text.isNotEmpty && userNameController.text.isNotEmpty &&
      passwordController.text == confirmPasswordController.text
      ) {
      isButtonEnabled = true;
    } else {
      isButtonEnabled = false;
    }
    setState(() {});
  }
}



/*

باقي 3 سيشن 
الاثنين الجاييين هيبقوا سبت عشان دول اهم سيشن 
الثالثله هتبقى خميس إن شاء الله لأنها سهله

Next Sessions:
  Device Camera
  Shared Preferences
  Front-end Back-end & API
  Firebase
  Google Map Implementation
  State Managment


*/
