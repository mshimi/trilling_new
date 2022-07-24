import 'package:flutter/material.dart';


class LoginTextFormField extends StatelessWidget {
  final String labelText;
  final IconData prefixIcon;
  final IconButton? suffixIcon;
  final bool obscureText;
  final String? Function(String?)? validate;
  final TextEditingController? controller;
  final String? errorText;

  const LoginTextFormField({
    Key? key,
    required this.labelText,
    required this.prefixIcon,
    this.obscureText = false,
    this.suffixIcon,
    this.validate,
    this.controller,
    this.errorText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 500, maxHeight: 100),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      child: TextFormField(
        
        controller: controller,
        decoration: InputDecoration(
          errorText: errorText,
            label: Text(
              labelText,
              style: const TextStyle(
                  color: Colors.blueGrey, fontWeight: FontWeight.bold),
            ),
            labelStyle: const TextStyle(color: Colors.blueGrey),
            prefixIcon: Icon(
              prefixIcon,
              color: Colors.blueGrey,
            ),
            suffixIcon: suffixIcon,
            border: const OutlineInputBorder(),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueGrey))),
        obscureText: obscureText,
        validator: validate,
      ),
    );
  }
}
