import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String buttonTitle;
  final Color buttonColor;
  final Color buttonTextColor;
  final double fontSize;
  CustomButton(
      {this.buttonTitle,
      this.buttonColor = const Color(0xFFff5733),
      this.buttonTextColor = Colors.white,
      this.fontSize = 20});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
        left: 30,
        right: 30,
      ),
      child: new Container(
        width: width,
        height: 60,
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(8),
          color: buttonColor,
        ),
        child: Center(
          child: new Text(
            buttonTitle,
            style: GoogleFonts.ubuntu(
              color: buttonTextColor,
              fontSize: fontSize,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}
