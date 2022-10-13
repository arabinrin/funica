import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.grey,
      primaryColor: isDarkTheme ? Colors.white : Colors.black,
      backgroundColor: isDarkTheme ? Colors.black : Colors.white,
      indicatorColor: isDarkTheme ? const Color(0xff36454F) : Colors.white,
      hintColor: isDarkTheme ? Colors.white : Colors.grey,
      highlightColor:
          isDarkTheme ? Colors.white70 : Colors.grey.withOpacity(.8),
      hoverColor:
          isDarkTheme ? const Color(0xff36454F) : Colors.grey.withOpacity(.15),
      toggleableActiveColor:
          isDarkTheme ? Colors.black54 : Colors.grey.withOpacity(.3),
      focusColor:
          isDarkTheme ? const Color(0xff0B2512) : Colors.grey.withOpacity(.3),
      disabledColor: Colors.grey,
      cardColor: isDarkTheme ? Colors.black87 : Colors.white,
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme
              ? const ColorScheme.dark()
              : const ColorScheme.light()),
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
      ),
    );
  }
}
