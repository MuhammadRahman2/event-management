import 'package:event/screen/authentication.dart';
import 'package:event/screen/bar_code.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/circle_container.dart';

class AdminUser extends StatelessWidget {
  const AdminUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        const CirlceContainer(),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(
                color: const Color.fromRGBO(60, 195, 240, 1),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 2),
                  child: Text('Admin'),
                ),
                onPressed: () {
                   Navigator.push(context,
                     MaterialPageRoute(builder: (context) => BarcodeScannerScreen()));
                },
              ),
              const SizedBox(height: 20),
              CupertinoButton(
                color: const Color.fromRGBO(60, 195, 240, 1),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 2),
                  child: Text('Users '),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AuthenticationScreen(),
                      ));
                },
              ),
            ],
          ),
        )
      ],
    ));
  }
}
