import 'package:event/screen/home_screen.dart';
import 'package:event/screen/navigation/dashbord.dart';
import 'package:event/screen/sign_in.dart';
import 'package:event/widgets/circle_container.dart';
import 'package:event/widgets/container_button.dart';
import 'package:event/widgets/repeat_textfield.dart';
import 'package:event/widgets/textfield_title.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  final VoidCallback? onClick;
  const SignUp({super.key, this.onClick});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();
  final usernameC = TextEditingController();
  final emailC = TextEditingController();
  final passwordC = TextEditingController();
  final comfirmPasswordC = TextEditingController();
  final dobC = TextEditingController();
  bool? isSigning = false;
  bool _showConfirmPassword = false;
  bool _showPassword = false;

  @override
  void dispose() {
    emailC.dispose();
    passwordC.dispose();
    dobC.dispose();
    super.dispose();
  }

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
                      key: formKey,
                      child: Column(
                        children: [
                          const TextTitle(
                            title: 'Full Name',
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: TextFormField(
                              controller: usernameC,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'your email field is empty';
                                }
                                return null;
                              },
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                hintText: 'Enter Your Full Username',
                                fillColor: Colors.grey.withOpacity(0.3),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          const TextTitle(
                            title: 'E-mail',
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: TextFormField(
                              controller: emailC,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'your email field is empty';
                                }
                                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                    .hasMatch(value)) {
                                  return 'Please enter a valid email format';
                                }
                                return null;
                              },
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                hintText: 'Enter Your email',
                                fillColor: Colors.grey.withOpacity(0.3),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),

                          const TextTitle(
                            title: 'Password',
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: TextFormField(
                              controller: passwordC,
                              obscureText: _showPassword,
                              validator: (value) {
                                if (value!.length < 6) {
                                  return 'Password must be 6 charter';
                                }
                                return null;
                              },
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                hintText: 'Enter your Password',
                                fillColor: Colors.grey.withOpacity(0.3),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _showPassword = !_showPassword;
                                    });
                                  },
                                  child: Icon(
                                    _showPassword
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          const TextTitle(
                            title: 'ConFirm Password',
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: TextFormField(
                              controller: comfirmPasswordC,
                              obscureText: _showConfirmPassword,
                              validator: (value) {
                                if (value!.length < 6) {
                                  return 'Password must be 6 charter';
                                }
                                return null;
                              },
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                hintText: 'Enter repeat Password',
                                fillColor: Colors.grey.withOpacity(0.3),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _showConfirmPassword =
                                          !_showConfirmPassword;
                                    });
                                  },
                                  child: Icon(
                                    _showConfirmPassword
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          const TextTitle(
                            title: 'D.O.P',
                          ),
                          // ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextFormField(
                              controller: dobC,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Date of Bired is Empty';
                                }
                                return null;
                              },
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                hintText: 'Enter Your Date of birth',
                                fillColor: Colors.grey.withOpacity(0.3),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(60, 195, 240, 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          minimumSize: const Size(
                            double.infinity,
                            45,
                          )),
                      onPressed: () {
                        signUpUser();
                      },
                      child: isSigning == true
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text('Sign UP')),
                ),
                Container(
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account? '),
                      TextButton(
                        onPressed: widget.onClick,
                        child: const Text(
                          'Sign in',
                          style: TextStyle(
                              color: Color.fromRGBO(60, 195, 240, 1),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      // const SizedBox(
                      //   height: 50,
                      // )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future signUpUser() async {
    if (formKey.currentState!.validate()) {
      if (comfirmPasswordC.text == passwordC.text) {
        setState(() {
          isSigning = true;
        });

        try {
          await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: emailC.text, password: passwordC.text)
              .then((value) {
            setState(
              () => isSigning = false,
            );
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => MyHomePage()), (route) => false);
            // Navigator.pushAndRemoveUntil(
            //     context, MaterialPageRoute(builder: (_) => MyHomePage()), );
          });
          // }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            createSnackBar('The password provided is too weak.');
            print('The password provided is too weak.');
          } else if (e.code == 'email-already-in-use') {
            createSnackBar('The account already exists for that email.');
            print('The account already exists for that email.');
          }
        } catch (e) {
          createSnackBar('SignUp error is: $e');
          print('SignUp error is: $e');
        }
      } else {
        createSnackBar('your Password is\'t same');
      }
    }
  }

  void createSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
