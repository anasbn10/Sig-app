import 'package:flutter/material.dart';
import 'package:aan_app/widgets/myButton.dart';
import 'package:aan_app/widgets/colors.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // add an image
          const Padding(
            padding: EdgeInsets.only(
              top: 100.0,
            ),
            child: SizedBox(
                height: 300.0,
                child:
                    Center(child: Image(image: AssetImage('images/logo.png')))),
          ),
          const SizedBox(height: 60.0),
          // add a sign in button
          MyButton(
              color: color2,
              title: 'Sign in',
              textColor: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, 'SignPage');
              }),
          const SizedBox(height: 7.0),
          // add a register button
          MyButton(
              color: color1,
              title: 'Register',
              textColor: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, 'RegistrationPage');
              }),
        ],
      ),
    );
  }
}
// create a welcome page


