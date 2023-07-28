import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class MainButton extends StatelessWidget {
  const MainButton(
      {super.key,
      required this.text,
      required this.width,
      required this.height,
      required this.onPressed,
      required this.borderThickness,
      required this.borderColor,
      required this.fontSize,
      required this.fontWeight});

  final String text;
  final double width;
  final double height;
  final VoidCallback onPressed;
  final double borderThickness;
  final List<Color> borderColor;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: GradientBoxBorder(
            gradient: LinearGradient(
              colors: borderColor,
            ),
            width: borderThickness),
      ),
      child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSize,
              fontFamily: "Ubuntu",
              fontWeight: fontWeight,
            ),
          )),
    );
  }
}
