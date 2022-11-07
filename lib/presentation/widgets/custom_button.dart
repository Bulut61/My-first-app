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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: InkWell(
        onTap: () => onPressed(),
        child: Material(
          elevation: 30,
          borderRadius: BorderRadius.circular(8),
          child: Container(
            height: 60, // MediaQuery.of(context).size.height/5
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
      ),
    );
  }
}
