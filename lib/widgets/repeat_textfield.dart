import 'package:flutter/material.dart';

class RepeatTextField extends StatelessWidget {
  final String? hint;
  const RepeatTextField({super.key, this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      // decoration: BoxDecoration(
      //     // color: Colors.grey.withOpacity(0.3),
      //     borderRadius: BorderRadius.circular(8)),
      child: TextFormField(
        style: const TextStyle(fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            hintText: hint,
            fillColor: Colors.grey.withOpacity(0.3),
            filled: true,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
