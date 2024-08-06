import 'package:flutter/material.dart';

import 'color.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(
          primary: AppColors.whiteColor,
        )
        .copyWith(secondary: AppColors.whiteColor),
  );
}

TextTheme textTheme() {
  return const TextTheme(
    bodyMedium: TextStyle(
      color: AppColors.whiteColor,
      fontSize: 16,
      fontFamily: "Urbanist",
    ),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: AppColors.whiteColor,
    elevation: 0,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  );
}
