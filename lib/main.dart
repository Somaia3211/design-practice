import 'package:flutter/material.dart';
import 'package:ui_design/screen/LandingScreen.dart';

import 'dart:ui';

import 'package:ui_design/utils/constant.dart';


void main(){
  runApp(MyApp());
}class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    double screenWidth=window.physicalSize.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Episode 1',

      theme:ThemeData(primaryColor: COLOR_WHITH,accentColor:COLOR_DARK_BLUE,
        textTheme: screenWidth < 500 ?TEXT_THEME_SMALL:TEXT_THEME_DEFAULT,),

      home: LandingScreen(),
    );
  }
}
