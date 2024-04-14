import 'package:flutter/material.dart';

class UsernameField extends StatelessWidget {
  final controller;
  final String hintText;
  final IconData icon;


  const UsernameField({
    this.controller,
    required this.hintText,
    required this.icon,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade500),
          borderRadius: BorderRadius.circular(5),
        ),
        fillColor: Colors.white,
        filled: true,
        labelText: hintText,
        suffixIcon: Icon(icon, color: Colors.grey),
        labelStyle: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.w400),
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  final controller;
  final String hintText;

  const PasswordField({
    this.controller,
    required this.hintText,
    super.key
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _obscureText,
      obscuringCharacter: '•',
      controller: widget.controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade500),
          borderRadius: BorderRadius.circular(5),
        ),
        fillColor: Colors.white,
        filled: true,
        labelText: widget.hintText,
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
        labelStyle:
        TextStyle(color: Colors.grey[600], fontWeight: FontWeight.w400),
      ),
    );
  }
}
