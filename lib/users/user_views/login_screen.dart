import 'package:flutter/material.dart';
import 'package:lander/shared/shared_theme/shared_colors.dart';
import 'package:lander/shared/shared_theme/shared_fonts.dart';
import 'package:lander/shared/shared_widgets/field_components.dart';
import 'package:lander/users/user_views/bottom_navigation.dart';
import 'package:lander/users/user_views/signup_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isSecure = true;
  bool isButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SharedColors.backGroundColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Text('Welcome! Login\n', style: TextStyle(color: SharedColors.blackColor, fontSize: 45.0, fontWeight: FontWeight.bold)),
            ),
            field('Email Address', Icons.email, false, emailController, FieldType.email),
            field('Password', Icons.lock, isSecure, passwordController, FieldType.password),
            InkWell(
              onTap: () {},
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text('Forgot Password?!     \n', style: SharedFonts.greyFont,),
              ),
            ),
            TextButton(
              child: Text('Login', style: SharedFonts.whiteFont),
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
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, 'register');
              },
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text('\n Dont have an account? ... Signup', style: SharedFonts.redFont),
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
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      isButtonEnabled = true;
    } else {
      isButtonEnabled = false;
    }
    setState(() {});
  }
}