import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lander/spaces/space_logic/map_controller.dart';
import 'package:lander/spaces/space_logic/space_controller.dart';
import 'package:lander/users/user_views/login_screen.dart';
import 'package:lander/users/user_views/signup_screen.dart';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

@override
 Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MapController()),
        BlocProvider(create: (context) => SpaceController()),
      ],
      child: LoginScreen(),
    ),
    routes: {
      'register' : (context) => SignUpScreen(),
    },
  );
 }
}