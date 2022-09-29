import 'package:flutter/material.dart';

class CusstomTextFeilds extends StatelessWidget {
  final TextEditingController controller;
  final String hinttext;
  final TextInputType keyboardtype;
  final String labeltext;
  final Icon icon;
  final bool obscuretext;
  const CusstomTextFeilds(
      {super.key,
      required this.controller,
      required this.hinttext,
      required this.keyboardtype,
      required this.labeltext,
      required this.icon,
      required this.obscuretext});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextFormField(
        obscureText: obscuretext,
        controller: controller,
        keyboardType: keyboardtype,
        autofocus: true,
        validator: (input) {
          if (input!.isEmpty) {
            return 'cant be null';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          labelText: labeltext,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          prefixIcon: icon,
        ),
      ),
    );
  }
}
