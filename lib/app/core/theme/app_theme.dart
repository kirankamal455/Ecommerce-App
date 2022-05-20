import 'package:calzada/app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

final ThemeData appThemeData = ThemeData(
  primarySwatch: blue,
  scaffoldBackgroundColor: cream,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: green,
    ),
  ),
  iconTheme: IconThemeData(
    // color: Colors.black,
    size: 29.0,
  ),
);
