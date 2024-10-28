import 'package:aan_app/screens/getStarted_screen.dart';
import 'package:aan_app/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:aan_app/screens/welcome_screen.dart';
import 'package:aan_app/screens/sign_screen.dart';
import 'package:aan_app/screens/afterRegistration_screen.dart';
import 'package:aan_app/screens/home_screen.dart';
import 'package:aan_app/screens/profile_screen.dart';
import 'package:aan_app/screens/course_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //remove debug banner
      debugShowCheckedModeBanner: false,
      title: 'Educational app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  HomePage(),
      initialRoute: 'WelcomePage', // add a routes
      routes: {
        'WelcomePage': (context) => const WelcomePage(),
        'SignPage': (context) => SignPage(),
        'RegistrationPage': (context) => RegistrationPage(),
        'AfterRegistrationPage': (context) => const AfterRegistrationPage(),
        'GetStartedPage': (context) => GetStartedPage(),
        'HomePage': (context) => HomePage(),
        'ProfilePage': (context) => ProfilePage(),
        'CoursePage': (context) => CoursePage(),
      },
    );
  }
}
