
import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class Styles {
  //colors

  //custom font style
  static TextStyle primaryText() {
    return const TextStyle(
      color: AppColors.white,
      fontSize: 34,
    );
  }

  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.blue,
      primaryColor: isDarkTheme ? Colors.black : Colors.white,
      canvasColor: isDarkTheme ? AppColors.black : AppColors.white,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? const ColorScheme.dark() : const ColorScheme.light()),
    );
  }
}
