import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  final String? title;
  
  const TextTitle({super.key,this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child:  Text(title!),
    );
  }
}
