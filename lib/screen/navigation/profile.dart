import 'package:event/screen/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          UserAccountsDrawerHeader(
              accountName: Text(firebaseAuth.currentUser!.email.toString()),
              accountEmail:
                  Text(firebaseAuth.currentUser!.displayName.toString())),
          const Card(
            child: ListTile(
              title: Text('setting'),
              trailing: Icon(Icons.settings),
            ),
          ),
          InkWell(
            onTap: () {
              FirebaseAuth.instance
                  .signOut()
                  .then((value) => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SignIn()),
                      ));
            },
            child: const Card(
              child: ListTile(
                title: Text('Sign Out'),
                trailing: Icon(Icons.logout),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
