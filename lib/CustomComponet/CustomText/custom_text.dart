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
      // style: GoogleFonts.poppins(
      //     fontSize: 15 ,
      //     fontWeight: FontWeight.w500,
      //     color: Colors.black87,
      //     letterSpacing: 0.30
      // ),
      style: GoogleFonts.poppins(
          fontSize: fontSize ,
          fontWeight: fontWeight,
          color: Colors.black87,
        letterSpacing: 0.30
       ),
    );
  }
}
