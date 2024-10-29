import 'package:flutter/material.dart';
import 'package:aan_app/widgets/myButton.dart';
import 'package:aan_app/widgets/colors.dart';

//create a registration page
class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 100.0),
                child: SizedBox(
                  height: 200,
                  child: Image(
                    image: AssetImage('images/logo.png'),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            const SizedBox(
              height: 50.0,
              width: 300.0,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '  Enter your Name',
                ),
              ),
            ),
            const SizedBox(
              height: 19.0,
            ),
            const SizedBox(
              height: 50.0,
              width: 300.0,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '  Enter your Password',
                ),
                obscureText: true,
              ),
            ),
            const SizedBox(
              height: 19.0,
            ),
            SizedBox(
              height: 50.0,
              width: 300.0,
              child: DropdownButtonFormField(
                //change the width and the height of the dropdown button
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '  Choose your class',
                  labelStyle: TextStyle(fontSize: 18),
                ),
                items: const [
                  DropdownMenuItem(
                    child: Text('T-Kurs'),
                    value: 'T-Kurs',
                  ),
                  DropdownMenuItem(
                    child: Text('W-Kurs'),
                    value: 'W-Kurs',
                  ),
                  DropdownMenuItem(
                    child: Text('PSP'),
                    value: 'PSP',
                  ),
                ],
                onChanged: (String? value) {},
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            MyButton(
                color: color1,
                title: 'Register',
                textColor: Colors.white,
                onPressed: () {
                  Navigator.pushNamed(context, 'AfterRegistrationPage');
                }),
          ],
        ),
      ),
    );
  }
}
