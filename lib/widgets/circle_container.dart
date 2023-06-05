import 'package:flutter/material.dart';

class CirlceContainer extends StatelessWidget {
  const CirlceContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 90,
          width: 90,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(100),
            ),
            color: Color.fromRGBO(60, 195, 240, 1),
            // shape: BoxShape.circle,
          ),
        ),
        Container(
          height: 90,
          width: 90,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(100),
            ),
            color: Color.fromRGBO(60, 195, 240, 1),
            // shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}
