import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function()? onTap;
  final String buttonName;
  final Color textColor;
  final Color buttonColor;

  const CustomButton({
    Key? key,
    required this.onTap,
    required this.buttonName,
    required this.textColor,
    required this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      focusColor: buttonColor,
      child: Container(
        width: double.infinity, // Ensure the button fills its parent's width
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        decoration: BoxDecoration(
          color: buttonColor, // Use buttonColor for the button's background color
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            buttonName,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}