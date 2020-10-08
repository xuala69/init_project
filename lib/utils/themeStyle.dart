import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:init_project/utils/size_config.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.blue,
      //primary
      primaryColor: isDarkTheme ? Colors.grey[900] : Colors.grey[600],
      //background not so useful
      backgroundColor: isDarkTheme ? Colors.black : Colors.grey[200],
      indicatorColor: isDarkTheme ? Color(0xff0E1D36) : Color(0xffCBDCF8),
      //button not useful
      buttonColor: isDarkTheme ? Colors.red : Colors.deepOrange,
      hintColor: isDarkTheme ? Color(0xff280C0B) : Color(0xffEECED3),
      highlightColor: isDarkTheme ? Color(0xff372901) : Color(0xffFCE192),
      hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),
      focusColor: isDarkTheme ? Color(0xff0B2512) : Color(0xffA8DAB5),
      disabledColor: Colors.grey,
      textSelectionColor: isDarkTheme ? Colors.white : Colors.black,
      cardColor: isDarkTheme ? Colors.grey[800] : Colors.white,
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
      appBarTheme: AppBarTheme(
        elevation: 0.5,
      ),
      iconTheme: Theme.of(context).iconTheme.copyWith(
            color: isDarkTheme ? Colors.black : Colors.black,
            size: 25,
          ),
      textTheme: Theme.of(context).textTheme.copyWith(
            headline1: GoogleFonts.ptSans(
                //  fontSize: SizeConfig.textMultiplier * 2,
                ),
            headline2: GoogleFonts.lato(
                //  fontSize: SizeConfig.textMultiplier * 1.8,
                ),
            headline3: GoogleFonts.lato(
                //  fontSize: SizeConfig.textMultiplier * 1.6,
                ),
            headline4: GoogleFonts.lato(
                //  fontSize: SizeConfig.textMultiplier * 1.4,
                ),
            headline5: GoogleFonts.lato(
                //  fontSize: SizeConfig.textMultiplier * 1.2,
                ),
            //headline6 for bottom nav bar
            headline6: GoogleFonts.lato(
              color: Colors.white,
              fontSize: SizeConfig.textMultiplier * 1.2,
            ),
            bodyText1: GoogleFonts.ptSans(
                // fontSize: SizeConfig.textMultiplier * 1.5,
                ),
            bodyText2: GoogleFonts.ptSans(
                //  fontSize: SizeConfig.textMultiplier * 1.3,
                // color: isDarkTheme ? Colors.white : Colors.white,
                ),
            subtitle1: GoogleFonts.ptSans(
                //  fontSize: SizeConfig.textMultiplier * 1.2,
                ),
            subtitle2: GoogleFonts.ptSans(
                // fontSize: SizeConfig.textMultiplier * 1,
                ),
            button: GoogleFonts.ptSans(
                // fontSize: SizeConfig.textMultiplier * 1.2,
                ),
          ),
    );
  }
}
