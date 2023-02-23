import 'package:event/screen/sign_in.dart';
import 'package:event/screen/sign_up.dart';
import 'package:event/widgets/circle_container.dart';
import 'package:event/widgets/container_button.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const CirlceContainer(),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    'Event Registration \n System with QR Code',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    'assets/images/scanner_hand.PNG',
                    width: 300,
                    height: 185,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.height,
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            Image.asset(
                              'assets/images/undraw_regain_focus_ecvj.png',
                              width: 336,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                            const Positioned(
                              top: 40,
                              left: 181,
                              child: Text(
                                'Gets things\ndone with\nToDo',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  ContainerButton(
                    colors: const Color.fromRGBO(60, 195, 240, 1),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignIn(),
                        ),
                      );
                    },
                    title: 'Get Started',
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
