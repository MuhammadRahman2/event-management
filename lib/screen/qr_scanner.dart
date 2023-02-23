import 'package:flutter/material.dart';
import '../widgets/circle_container.dart';
class QrScanner extends StatelessWidget {
  const QrScanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Stack(
      children: [
        const  CirlceContainer(),
        Column(children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/mobile ticket.jpg'))
            ),
          )
        ],)
      ],
    ),);
  }
}