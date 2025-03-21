import 'package:auto_care_assistant/shared/config/constants.dart';
import 'package:flutter/material.dart';

final ThemeData globalTheme = ThemeData();

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  primaryColor: primaryColor,
  appBarTheme: const AppBarTheme(toolbarHeight: toolbarHeight),
  searchBarTheme: const SearchBarThemeData(
    elevation: WidgetStatePropertyAll(elevation),
  ),
);

final ThemeData darkTheme = ThemeData.dark().copyWith(
  appBarTheme: const AppBarTheme(toolbarHeight: toolbarHeight),
  primaryColor: primaryColor,
  searchBarTheme: const SearchBarThemeData(
    elevation: WidgetStatePropertyAll(elevation),
  ),
);
