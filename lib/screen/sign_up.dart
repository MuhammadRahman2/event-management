import 'package:event/screen/sign_in.dart';
import 'package:event/widgets/circle_container.dart';
import 'package:event/widgets/container_button.dart';
import 'package:event/widgets/repeat_textfield.dart';
import 'package:event/widgets/textfield_title.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            const CirlceContainer(),
            Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  'Welcome Onboard',
                  style: TextStyle(fontSize: 25),
                ),
                const Text(
                  'Create an Account with us & enjoy\n all our exciting event',
                  textAlign: TextAlign.center,
                ),
                Container(
                  width: double.infinity,
                  child: Form(
                      child: Column(
                    children: const [
                      TextFieldTitle(
                        title: 'Full Name',
                      ),
                      RepeatTextField(
                        hint: 'Full Name',
                      ),
                      TextFieldTitle(
                        title: 'E-mail',
                      ),
                      RepeatTextField(
                        hint: 'E-mail',
                      ),
                      TextFieldTitle(
                        title: 'Password',
                      ),
                      RepeatTextField(
                        hint: 'Password',
                      ),
                      TextFieldTitle(
                        title: 'ConFirm Password',
                      ),
                      RepeatTextField(
                        hint: 'Confirm password',
                      ),
                      TextFieldTitle(
                        title: 'D.O.P',
                      ),
                      RepeatTextField(
                        hint: 'D.O.B',
                      ),
                    ],
                  )),
                ),
                const ContainerButton(
                  colors:  Color.fromRGBO(60, 195, 240, 1),
                  title: 'Create Account',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                   const  Text(
                      'Already have an account? ',
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>const  SignIn(),
                            ));
                      },
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                            color: Color.fromRGBO(60, 195, 240, 1),
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              
              ],
            ),
          ],
        ),
      ),
    );
  }
}
