import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'scaling.dart';

class AppTheme {
  static final light = _get(ThemeData.light());

  static final dark = _get(ThemeData.dark());

  static ThemeData _get(ThemeData base) {
    const primaryColor = Color(0xFFFCC01C);
    const body = Color(0xFF6F6E6D);

    return base.copyWith(
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        primary: primaryColor,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          foregroundColor: base.colorScheme.onPrimary,
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(s(8)),
          ),
          padding: EdgeInsets.symmetric(vertical: vs(8), horizontal: s(14)),
          textStyle: GoogleFonts.inter(
            fontSize: s(14),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: primaryColor, width: s(1)),
          padding: EdgeInsets.symmetric(vertical: vs(8), horizontal: s(27.5)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(s(8)),
          ),
          foregroundColor: primaryColor,
          textStyle: GoogleFonts.inter(
            fontSize: s(14),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      inputDecorationTheme: () {
        final border = OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color(0xFFE7E7E7),
            width: s(1),
          ),
          borderRadius: BorderRadius.circular(s(30)),
        );
        return InputDecorationTheme(
          border: border,
          enabledBorder: border,
          focusedBorder: border,
          contentPadding: EdgeInsets.symmetric(
            vertical: vs(12),
            horizontal: s(18),
          ),
          prefixIconColor: const Color(0xFF6F6E6D),
          hintStyle: GoogleFonts.poppins(
            fontSize: s(15),
            color: const Color(0xFF9F9F9E),
          ),
        );
      }(),
      textTheme: GoogleFonts.poppinsTextTheme().apply(
        bodyColor: body,
        displayColor: body,
      ),
    );
  }
}
