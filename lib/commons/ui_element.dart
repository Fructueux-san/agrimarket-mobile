import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final EdgeInsetsGeometry padding;
  final double fontSize;
  final Color textColor;
  final double borderRadius;
  final double? width;
  final double? height;
  final Icon? icon;

  const CustomButton(
      {Key? key,
      required this.title,
      required this.onPressed,
      this.backgroundColor = const Color.fromRGBO(83, 177, 117, 1),
      this.padding = const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      this.fontSize = 20,
      this.textColor = Colors.white,
      this.borderRadius = 10.0,
      this.width,
      this.height,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          backgroundColor: backgroundColor,
          padding: padding,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon != null ? icon! : Text(""),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                title,
                style: TextStyle(fontSize: fontSize, color: textColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
