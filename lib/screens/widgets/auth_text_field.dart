import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final String hentText;
  final TextEditingController controller;
  const AuthTextField(
      {super.key, required this.hentText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hentText,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
