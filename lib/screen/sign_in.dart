import 'package:event/screen/home_screen.dart';
import 'package:event/screen/navigation/dashbord.dart';
import 'package:event/screen/sign_up.dart';
import 'package:event/widgets/circle_container.dart';
import 'package:event/widgets/container_button.dart';
import 'package:event/widgets/repeat_textfield.dart';
import 'package:event/widgets/textfield_title.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final VoidCallback? onClick;
  const SignIn({super.key, this.onClick});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _fromKey = GlobalKey<FormState>();
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  bool? isSinging = false;
  bool showPassword = false;

  @override
  void dispose() {
    emailC.dispose();
    passwordC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            // User is already signed in, navigate to home page
            return MyHomePage();
          }
          return Scaffold(
              body: SingleChildScrollView(
            child: Stack(
              children: [
                const CirlceContainer(),
                Column(
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    const Text(
                      'Welcome Back!',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
                    Form(
                      key: _fromKey,
                      child: Column(
                        children: [
                          const TextTitle(title: 'E-mail'),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: TextFormField(
                              controller: emailC,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'your email field is empty';
                                }
                                return null;
                              },
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                hintText: 'Enter E-mail',
                                fillColor: Colors.grey.withOpacity(0.3),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              // onSaved: onSave,
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
                              obscureText: showPassword,
                              validator: (value) {
                                if (value!.length < 6) {
                                  return 'Password must be 6 charter';
                                }
                                return null;
                              },
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                hintText: 'Enter Password',
                                fillColor: Colors.grey.withOpacity(0.3),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                suffixIcon: InkWell(
                                  onTap: () {
                                    setState(() {
                                      showPassword = !showPassword;
                                    });
                                  },
                                  child: Icon(
                                    showPassword
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              minimumSize: const Size(
                                double.infinity,
                                45,
                              )),
                          onPressed: () {
                            signInUser();
                          },
                          child: isSinging == true
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text('SignIn')),
                    ),
                    Container(
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('If you have no account First '),
                          TextButton(
                            onPressed: widget.onClick,
                            child: const Text(
                              'Sign up',
                              style: TextStyle(
                                  color: Color.fromRGBO(60, 195, 240, 1),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ));
        });
  }

  Future signInUser() async {
    if (_fromKey.currentState!.validate()) {
      // _fromKey.currentState!.save();
      setState(() {
        isSinging = true;
      });
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailC.text, password: passwordC.text)
            .then((value) {
          emailC.clear();
          passwordC.clear();
          Navigator.pushAndRemoveUntil(
              context, MaterialPageRoute(builder: (_) => MyHomePage()), (route) =>  false,);
          setState(() {
            isSinging = false;
          });
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          createSnackBar('No user found for that email');
          print('No user found for that email.');
          setState(() {
            isSinging = false;
          });
        } else if (e.code == 'wrong-password') {
          createSnackBar('Wrong password provided for that user');
          print('Wrong password provided for that user');
          setState(() {
            isSinging = false;
          });
        }
      } catch (e) {
        createSnackBar('Some error is :  $e');
        print('Some error is :  $e');
        setState(() {
          isSinging = false;
        });
      }
    }
  }

  void createSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
