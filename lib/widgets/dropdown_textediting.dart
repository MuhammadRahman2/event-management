import 'package:flutter/material.dart';

class DropDownTextEditing extends StatefulWidget {
  String? initValue;
  final List<dynamic>? ListValue;
  DropDownTextEditing({super.key, this.initValue, this.ListValue});

  @override
  State<DropDownTextEditing> createState() => _DropDownTextEditingState();
}

class _DropDownTextEditingState extends State<DropDownTextEditing> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      alignment: Alignment.center,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(
            // Set border color
            width: 1.0),
      ),
      child: DropdownButtonFormField(
        // itemHeight: 40,
        style: const TextStyle(fontSize: 10, color: Colors.black),
        alignment: Alignment.center,
        menuMaxHeight: 150,
        // dropdownColor: Colors.greenAccent,
        value: widget.initValue, // initiation Value
        onChanged: (String? newValue) {
          setState(() {
            widget.initValue = newValue!;
          });
        },
        // style: TextStyle(fontSize: 14),
        items: widget.ListValue!.map<DropdownMenuItem<String>>((value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: const TextStyle(fontSize: 20),
            ),
          );
        }).toList(),
      ),
    );
  }
}
