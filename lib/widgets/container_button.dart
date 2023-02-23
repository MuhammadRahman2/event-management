import 'package:flutter/material.dart';

class ContainerButton extends StatelessWidget {
  final String? title;
  // final ButtonStyle? buttonStyle;
  final Color? colors;
  final VoidCallback? onTap;
  const ContainerButton({super.key, this.title, this.onTap,this.colors});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: InkWell(
          onTap: onTap,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.075,
            decoration: BoxDecoration(
              color: colors,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
                child: Text(
              title!,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            )),
          ),
        ));
  }
}
