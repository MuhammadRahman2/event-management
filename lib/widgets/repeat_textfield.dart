import 'package:flutter/material.dart';

class RepeatTextField extends StatelessWidget {
  final String? hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? Function(String?)? onSave;
  const RepeatTextField({
    super.key,
    this.hint,
    this.controller,
    this.validator,
    this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        controller: controller,
        validator: validator,
        style: const TextStyle(fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            hintText: hint,
            fillColor: Colors.grey.withOpacity(0.3),
            filled: true,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10),),),
        onSaved:onSave ,
      ),
    );
  }
}
