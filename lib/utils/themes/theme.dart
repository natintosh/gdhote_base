import 'package:flutter/material.dart';
import 'package:gdhote/utils/helpers/types_helper.dart';
import 'package:google_fonts/google_fonts.dart';

class GdhoteThemeData {
  static Brightness getIconBrightness(
      BuildContext context, ThemeOptionType optionType) {
    if (optionType == ThemeOptionType.SYSTEM) {
      final brightness = WidgetsBinding.instance.window.platformBrightness;
      return brightness == Brightness.light
          ? Brightness.dark
          : Brightness.light;
    }

    return optionType == ThemeOptionType.LIGHT
        ? Brightness.dark
        : Brightness.light;
  }

  static ThemeMode getThemeMode(AsyncSnapshot<ThemeOptionType> snapshot) {
    if (snapshot.hasError) return ThemeMode.light;

    ThemeOptionType optionType = snapshot.data;

    return optionType == ThemeOptionType.LIGHT
        ? ThemeMode.light
        : optionType == ThemeOptionType.DARK
            ? ThemeMode.dark
            : ThemeMode.system;
  }

  static ThemeData get lightTheme => ThemeData.light().copyWith(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
          },
        ),
        colorScheme: ColorScheme(
          primary: const Color(0xFFFFFFFF),
          primaryVariant: const Color(0xFFDEDEDE),
          secondary: const Color(0xFF2196F3),
          secondaryVariant: const Color(0xFF1A75D2),
          surface: const Color(0xFFFFFFFF),
          background: const Color(0xFFFAFAFA),
          error: const Color(0xFFB00020),
          onPrimary: const Color(0xFF000000),
          onSecondary: const Color(0xFFFFFFFF),
          onSurface: const Color(0xFF000000),
          onBackground: const Color(0xFF000000),
          onError: const Color(0xFFFFFFFF),
          brightness: Brightness.light,
        ),
        primaryColor: const Color(0xFFFFFFFF),
        primaryColorLight: const Color(0xFFFFFFFF),
        primaryColorDark: const Color(0xFFDEDEDE),
        primaryColorBrightness: Brightness.light,
        primaryIconTheme: IconThemeData(color: const Color(0xFF000000)),
        accentColor: const Color(0xFF2196F3),
        accentColorBrightness: Brightness.light,
        accentIconTheme: IconThemeData(color: const Color(0xFFFFFFFF)),
        textTheme: getTextTheme(const Color(0xFF000000)),
        primaryTextTheme: getTextTheme(const Color(0xFF000000)),
        accentTextTheme: getTextTheme(const Color(0xFFFFFFFF)),
        appBarTheme: AppBarTheme(
          brightness: Brightness.light,
          color: const Color(0xFFFFFFFF),
          iconTheme: IconThemeData(color: const Color(0xFF000000)),
          actionsIconTheme: IconThemeData(color: const Color(0xFF000000)),
          textTheme: getTextTheme(const Color(0xFF000000)),
        ),
        buttonTheme: ButtonThemeData(
          padding: EdgeInsets.all(20.0),
          colorScheme: ColorScheme.light(),
          textTheme: ButtonTextTheme.primary,
          buttonColor: Colors.blue,
          disabledColor: const Color(0xFFBBDDFB),
        ),
        inputDecorationTheme: InputDecorationTheme(
          focusColor: const Color(0xFF2196F3),
          hoverColor: const Color(0xFF2196F3),
        ),
      );

  static ThemeData get darkTheme => ThemeData.dark().copyWith(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
          },
        ),
        accentColor: const Color(0xFF2196F3),
        accentColorBrightness: Brightness.dark,
        accentIconTheme: IconThemeData(color: const Color(0xFFFFFFFF)),
        textTheme: getTextTheme(const Color(0xFFFFFFFF)),
        primaryTextTheme: getTextTheme(const Color(0xFFFFFFFF)),
        accentTextTheme: getTextTheme(const Color(0xFFF0F0F0)),
        appBarTheme: AppBarTheme(
          textTheme: getTextTheme(const Color(0xFFFFFFFF)),
        ),
        buttonTheme: ButtonThemeData(
          padding: EdgeInsets.all(20.0),
          textTheme: ButtonTextTheme.primary,
          buttonColor: const Color(0xFF2196F3),
          disabledColor: const Color(0xFFBBDDFB),
        ),
      );

  static TextTheme getTextTheme(Color color) {
    return TextTheme(
      headline1: GoogleFonts.raleway(
        fontSize: 96,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5,
        color: color,
      ),
      headline2: GoogleFonts.raleway(
        fontSize: 60,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5,
        color: color,
      ),
      headline3: GoogleFonts.raleway(
        fontSize: 48,
        fontWeight: FontWeight.w400,
        color: color,
      ),
      headline4: GoogleFonts.raleway(
        fontSize: 34,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: color,
      ),
      headline5: GoogleFonts.raleway(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: color,
      ),
      headline6: GoogleFonts.raleway(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
        color: color,
      ),
      subtitle1: GoogleFonts.raleway(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
        color: color,
      ),
      subtitle2: GoogleFonts.raleway(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        color: color,
      ),
      bodyText1: GoogleFonts.raleway(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        color: color,
      ),
      bodyText2: GoogleFonts.raleway(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: color,
      ),
      button: GoogleFonts.raleway(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.25,
        color: color,
      ),
      caption: GoogleFonts.raleway(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
        color: color,
      ),
      overline: GoogleFonts.raleway(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5,
        color: color,
      ),
    );
  }
}
