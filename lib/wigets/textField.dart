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
      keyboardType: TextInputType.text,
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

class EmailField extends StatefulWidget {
  final String hintText;
  final IconData icon;

  const EmailField({
    Key? key,
    required this.hintText,
    required this.icon,
  }) : super(key: key);

  @override
  _EmailFieldState createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      keyboardType: TextInputType.emailAddress,
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
        suffixIcon: Icon(widget.icon, color: Colors.grey),
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
      keyboardType: TextInputType.text,
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
