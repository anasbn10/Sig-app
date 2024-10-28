import 'package:aan_app/widgets/myButton.dart';
import 'package:flutter/material.dart';
import 'package:aan_app/widgets/colors.dart';

class GetStartedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(208, 255, 255, 255),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Image.asset('images/logo.png'),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 13.0),
                child: Container(
                  height: 274,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: color2,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Column(
                      children: [
                        Text(
                          'Start Together',
                          style: TextStyle(
                            color: Colors.grey[100],
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 14.0, right: 14.0),
                          child: Text(
                            'Here you will find all your exams and lessons.',
                            style: TextStyle(
                              color: Colors.grey[200],
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              height: 2,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 26.0, right: 26.0),
                          child: MyButton(
                              color: color1,
                              title: 'Get Started',
                              textColor: Colors.white,
                              onPressed: () {
                                Navigator.pushNamed(context, 'HomePage');
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
