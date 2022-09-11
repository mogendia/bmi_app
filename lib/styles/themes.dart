import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  appBarTheme: const AppBarTheme(color: Colors.black,
  ),
  primarySwatch: Colors.indigo,
  iconTheme: const IconThemeData(color: Colors.white,
      size: 63
  ),
  canvasColor: Colors.black,
  textTheme: const TextTheme(

    bodyText2: TextStyle(
      color: Colors.white,
      fontSize: 29,
      fontFamily: 'janna',
      fontWeight: FontWeight.w800,
    ),
  ),
);

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.indigo,
  iconTheme: const IconThemeData(color: Colors.black,
      size: 63
  ),
  textTheme: const TextTheme(
    bodyText2: TextStyle(
      color: Colors.black,
      fontSize: 29,
      fontFamily: 'janna',
      fontWeight: FontWeight.w800,
    ),
  ),
);