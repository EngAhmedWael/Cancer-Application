
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constance.dart';
import '../constant.dart';

abstract class Styles {
  static TextStyle splashtext(context) => TextStyle(
    fontSize: MediaQuery.of(context).size.height * .02,
    fontWeight: FontWeight.w700,
    color: const Color(0xff646569),
    fontFamily: "FrutigerLTArabic",
  );




  static TextStyle onboardingdescriptiontext(context) => TextStyle(
    fontSize: MediaQuery.of(context).size.height * .018,
    fontWeight: FontWeight.w400,
    color: const Color(0xff6D7371),
    fontFamily: GoogleFonts.cairo.toString(),
  );

  static TextStyle smallbuttontext(context) => TextStyle(
    fontSize: MediaQuery.of(context).size.height * .02,
    color: Colors.white,
    fontFamily: GoogleFonts.cairo.toString(),
    fontWeight: FontWeight.w400,
  );

  static TextStyle text50010Black(context) => TextStyle(
    fontSize: AppConstants.sp10(context),
    color: Colors.black,
    fontFamily: GoogleFonts.cairo.toString(),
    fontWeight: FontWeight.w500,
  );
  static TextStyle text50010Green(context) => TextStyle(
    fontSize: AppConstants.sp20(context),
    color: secondary,
    fontFamily: GoogleFonts.cairo.toString(),
    fontWeight: FontWeight.w500,
  );

  static TextStyle text60012White(context) => TextStyle(
    fontSize: MediaQuery.of(context).size.height * .014,
    fontFamily: GoogleFonts.cairo.toString(),
    fontWeight: FontWeight.w600,
  );

  static TextStyle text40015Black(context) => TextStyle(
    fontSize: AppConstants.sp15(context),
    color: Colors.black,
    fontFamily: GoogleFonts.cairo.toString(),
    fontWeight: FontWeight.w400,
  );

  static TextStyle text40012Black(context) => TextStyle(
    fontSize: MediaQuery.of(context).size.height * .014,
    color: Colors.black,
    fontFamily: GoogleFonts.cairo.toString(),
    fontWeight: FontWeight.w400,
  );

  static TextStyle text40012White(context) => TextStyle(
    fontSize: MediaQuery.of(context).size.height * .014,
    fontFamily: GoogleFonts.cairo.toString(),
    fontWeight: FontWeight.w400,
  );

  static TextStyle text50020Black(context) => TextStyle(
    fontSize: AppConstants.sp20(context),
    color: Colors.black,
    fontFamily: GoogleFonts.cairo.toString(),
    fontWeight: FontWeight.w500,
  );
  static TextStyle text50020Grey(context) => TextStyle(
    fontSize: AppConstants.sp20(context),
    color: Color(0xff98999B),
    fontFamily: GoogleFonts.cairo.toString(),
    fontWeight: FontWeight.w500,
  );

  static TextStyle text50012Black(context) => TextStyle(
    fontSize: MediaQuery.of(context).size.height * .014,
    color: Colors.black,
    fontFamily: GoogleFonts.cairo.toString(),
    fontWeight: FontWeight.w500,
  );

  static TextStyle text50015Black(context) => TextStyle(
    fontSize: AppConstants.sp15(context),
    color: Colors.black,
    fontFamily: GoogleFonts.cairo.toString(),
    fontWeight: FontWeight.w500,
  );

  static TextStyle text50016Black(context) => TextStyle(
    fontSize: MediaQuery.of(context).size.height * .017,
    color: Colors.black,
    fontFamily: GoogleFonts.cairo.toString(),
    fontWeight: FontWeight.w500,
  );

  static TextStyle text70016Black(context) => TextStyle(
    fontSize: MediaQuery.of(context).size.height * .017,
    color: Colors.black,
    fontFamily: GoogleFonts.cairo.toString(),
    fontWeight: FontWeight.w700,
  );

  static TextStyle text70010Black(context) => TextStyle(
    fontSize: AppConstants.sp10(context),
    color: Colors.black,
    fontFamily: GoogleFonts.cairo.toString(),
    fontWeight: FontWeight.w700,
  );

  static TextStyle text60010White(context) => TextStyle(
      fontSize: AppConstants.sp10(context),
      fontFamily: GoogleFonts.cairo.toString(),
      fontWeight: FontWeight.w600,
      color: Colors.white);

  static TextStyle text70012Black(context) => TextStyle(
    fontSize: MediaQuery.of(context).size.height * .014,
    color: Colors.black,
    fontFamily: GoogleFonts.cairo.toString(),
    fontWeight: FontWeight.w700,
  );

  static TextStyle text80012Black(context) => TextStyle(
    fontSize: MediaQuery.of(context).size.height * .014,
    color: Colors.black,
    fontFamily: GoogleFonts.cairo.toString(),
    fontWeight: FontWeight.w800,
  );

  static TextStyle textLogo70030(context) => TextStyle(
    color:Color(0xff666C6A),
    fontSize: AppConstants.sp30(context),
    fontWeight: FontWeight.w700,
    fontFamily: GoogleFonts.cairo.toString(),
  );

  static TextStyle textLogo70030black(context) => TextStyle(
    fontSize: AppConstants.height40(context),
    fontWeight: FontWeight.w700,
    color: Colors.black,
    fontFamily: GoogleFonts.cairo.toString(),
  );

  static TextStyle textLogo70015black(context) => TextStyle(
    fontSize: AppConstants.sp15(context),
    fontWeight: FontWeight.w700,
    color: Colors.black,
    fontFamily: GoogleFonts.cairo.toString(),
  );

  static TextStyle text70028black(context) => TextStyle(
    fontSize: AppConstants.sp30(context),
    fontWeight: FontWeight.w700,
    color: Colors.black,
    fontFamily: GoogleFonts.cairo.toString(),
  );

  static TextStyle text70025black(context) => TextStyle(
    fontSize: MediaQuery.of(context).size.height*.028,
    fontWeight: FontWeight.w700,
    color: Colors.black,
    fontFamily: GoogleFonts.cairo.toString(),
  );

  static TextStyle textLogo70020Black(context) => TextStyle(
    fontSize: AppConstants.sp20(context),
    fontWeight: FontWeight.w700,
    color: Color(0xff595959),
    fontFamily: GoogleFonts.cairo.toString(),
  );

  static TextStyle text70025Black(context) => TextStyle(
    fontSize: AppConstants.sp20(context),
    fontWeight: FontWeight.w700,
    color: Colors.black,
    fontFamily: GoogleFonts.cairo.toString(),
  );

  static TextStyle textLogoBold16Black(context) => TextStyle(
    fontSize: AppConstants.sp15(context),
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontFamily: GoogleFonts.cairo.toString(),
  );

  static TextStyle text12Black(context) => TextStyle(
    fontSize: AppConstants.sp10(context),
    color: Colors.black,
    fontFamily: GoogleFonts.cairo.toString(),
  );

  static TextStyle text20Black(context) => TextStyle(
    fontSize: AppConstants.sp20(context),
    color: Colors.black,
    fontFamily: GoogleFonts.cairo.toString(),
  );

  static TextStyle text16Black(context) => TextStyle(
    fontSize: AppConstants.sp15(context),
    color: Colors.black,
    fontFamily: GoogleFonts.cairo.toString(),
  );

  static TextStyle textLogo70025Black(context) => TextStyle(
    fontSize: AppConstants.sp24(context),
    fontWeight: FontWeight.w700,
    color: Colors.black,
    fontFamily: GoogleFonts.cairo.toString(),
  );


}