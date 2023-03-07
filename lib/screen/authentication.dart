import 'package:event/screen/sign_in.dart';
import 'package:event/screen/sign_up.dart';
import 'package:flutter/material.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  bool isSignIn = true;
  @override
  Widget build(BuildContext context) {
    return isSignIn ? SignIn(onClick: switchPage,): SignUp(onClick:  switchPage,);
  }
  switchPage()=>setState(() => isSignIn =! isSignIn );
}