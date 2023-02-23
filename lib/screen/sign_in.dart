import 'package:event/screen/dashbord.dart';
import 'package:event/screen/sign_up.dart';
import 'package:event/widgets/circle_container.dart';
import 'package:event/widgets/container_button.dart';
import 'package:event/widgets/repeat_textfield.dart';
import 'package:event/widgets/textfield_title.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        const CirlceContainer(),
        Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            const Text(
              'Welcome Back!',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              // width: MediaQuery.of(context).size.width,
              height: 240,
              child: Image.asset(
                'assets/images/login_event.PNG',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const TextFieldTitle(title: 'E-mail'),
            const RepeatTextField(
              hint: 'E-mail',
            ),
            const TextFieldTitle(
              title: 'Password',
            ),
            const RepeatTextField(
              hint: 'Password',
            ),
            ContainerButton(
              colors: const Color.fromRGBO(60, 195, 240, 1),
              title: 'Login',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DashBord(),
                    ));
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'If you have no account? ',
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUp(),
                        ));
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Color.fromRGBO(60, 195, 240, 1),
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        )
      ],
    ));
  }
}
