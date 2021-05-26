import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home_page.dart';
import 'package:flutter_app/pages/login_page.dart';
import 'package:flutter_app/uitls/routes.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_app/widgets/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: Mytheme.lightTheme(context),
      darkTheme: Mytheme.lightTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: Myroutes.loginroute,
      routes: {
        "/": (context) => Loginpage(),
        Myroutes.homeroute: (context) => HomePage(),
        Myroutes.loginroute: (context) => Loginpage()
      },
    );
  }
}
