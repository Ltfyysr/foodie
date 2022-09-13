import 'package:flutter/material.dart';
import 'package:foodie/colors.dart';
import 'package:foodie/views/landing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: color4,
          elevation: 0,
        )
      ),
      home: const LandingPage(),
    );
  }
}

