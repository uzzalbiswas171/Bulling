import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTText extends StatelessWidget {
  CustomTText({super.key,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    required this.textcolor,
  });
  String text;
  double fontSize;
  final FontWeight? fontWeight;
  Color? textcolor;
  @override
  Widget build(BuildContext context) {
    return Text(
      '$text',
      style: GoogleFonts.roboto(
          fontSize: fontSize ,
          fontWeight: fontWeight,
          color: textcolor
      ),
    );
  }
}
