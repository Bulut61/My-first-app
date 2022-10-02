import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color buttonColor;
  const CustomButton({super.key, required this.onPressed, required this.text, required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(),
      child: Material(
        elevation: 26,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: buttonColor),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
