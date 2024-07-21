import 'package:flutter/material.dart';

import 'app_pallete.dart';

class AppTheme {
  static _border([Color color = AppPallete.borderColor]) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: color,
          width: 3,
        ),
      );

  static get darkThemeMode => ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppPallete.backgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppPallete.backgroundColor,
        ),
        chipTheme: ChipThemeData(
          color: WidgetStateProperty.all(AppPallete.backgroundColor),
          side: BorderSide.none,
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.all(27),
          enabledBorder: _border(),
          border: _border(),
          focusedBorder: _border(AppPallete.gradient2),
          errorBorder: _border(AppPallete.errorColor),
        ),
      );
}
