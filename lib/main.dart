import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:untitled7/pages/homa_page.dart';
import 'package:untitled7/pages/login_page.dart';
import 'package:untitled7/pages/signup_page.dart';
import 'package:untitled7/pages/terms_services_page.dart';
import 'pages/splash.dart';
import '';
import 'theme/light_theme.dart';

void main() {
  //debugPaintSizeEnabled = true; // Enable to see widget boundaries
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,

      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) =>HomaPage() ,
        '/login': (context) => LoginPage(),
        '/signup':(context) => SignupPage(),
        '/terms': (context) => TermsPage(),  // Add the route for the TermsPage
      },
    );
  }
}
