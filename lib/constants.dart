import 'package:flutter/material.dart';


final ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.blue,
  brightness: Brightness.light,
);

final ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.blueGrey,
  brightness: Brightness.dark,
);


const TextStyle kHeaderTextStyle = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.bold,
);

const TextStyle kTitleTextStyle = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.w600,
);