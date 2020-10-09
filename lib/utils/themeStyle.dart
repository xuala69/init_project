import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:init_project/utils/size_config.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.grey,
      //primary
      primaryColor: isDarkTheme ? Colors.grey[900] : Colors.grey[600],
      //background not so useful
      backgroundColor: isDarkTheme ? Colors.black : Colors.grey[200],
      indicatorColor: isDarkTheme ? Colors.white : Colors.black,
      //button not useful
      buttonColor: isDarkTheme ? Colors.red : Colors.deepOrange,
      hintColor: isDarkTheme ? Color(0xff280C0B) : Color(0xffEECED3),
      disabledColor: Colors.grey,
      textSelectionColor: isDarkTheme ? Colors.white : Colors.black,
      cardColor: isDarkTheme ? Colors.grey[800] : Colors.white,
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
            colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light(),
            buttonColor: isDarkTheme ? Colors.red : Colors.blue[200],
          ),
      appBarTheme: AppBarTheme(
        elevation: 0.5,
      ),
      iconTheme: Theme.of(context).iconTheme.copyWith(
            color: isDarkTheme ? Colors.white : Colors.black,
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
              color: isDarkTheme ? Colors.grey[200] : Colors.grey[700],
              fontSize: SizeConfig.textMultiplier * 1.4,
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
