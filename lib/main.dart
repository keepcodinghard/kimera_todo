import 'package:flutter/material.dart';
import 'package:kimera_todo/screens/home.dart';
import 'package:kimera_todo/theme/custom_colors.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kimera Todo',
      theme: ThemeData(
        backgroundColor: CustomColors.background,
        textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
      ),
      home: Home(),
    );
  }
}
