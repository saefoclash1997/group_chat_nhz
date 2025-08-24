import 'package:flutter/material.dart';

Color kLightPrimary1 = Colors.green.shade400;
Color kLightPrimary2 = Colors.green.shade600;
Color kDarkPrimary1 = Colors.green.shade700;
Color kDarkPrimary2 = Colors.green.shade900;


LinearGradient kDarkGradiant = LinearGradient(colors: [
  kDarkPrimary1,
  kDarkPrimary2,
],
  begin: Alignment.topCenter,
  end:  Alignment.bottomCenter,

);

LinearGradient kLightGradiant = LinearGradient(colors: [
  kLightPrimary1,
  kLightPrimary2,
],
  begin: Alignment.topCenter,
  end:  Alignment.bottomCenter,

);