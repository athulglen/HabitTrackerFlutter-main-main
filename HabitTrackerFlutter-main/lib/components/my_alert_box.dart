import 'package:flutter/material.dart';

class MyAlertBox extends StatelessWidget {
  final controller;
  final String hintText;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const MyAlertBox({
    super.key,
    required this.controller,
    required this.hintText,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[900],
      content: TextField(
        controller: controller,
        style: const TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Color.fromARGB(255, 164, 163, 158)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 250, 250, 249))),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 0, 105, 252))),
        ),
      ),
      actions: [
        MaterialButton(
          onPressed: onSave,
          child: Text(
            "Save",
            style: TextStyle(color: Color.fromARGB(255, 207, 202, 202)),
          ),
          color: Color.fromARGB(255, 178, 53, 53),
        ),
        MaterialButton(
          onPressed: onCancel,
          child: Text(
            "Cancel",
            style: TextStyle(color: Color.fromARGB(255, 178, 53, 53)),
          ),
          color: Color.fromARGB(255, 207, 202, 202),
        ),
      ],
    );
  }
}
