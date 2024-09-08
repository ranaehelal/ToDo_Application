import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _showWelcomeText = false;  // Initially hide the "Welcome" text

  @override
  void initState() {
    super.initState();

    // Show "Welcome" text after 1 second
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _showWelcomeText = true;
      });
    });

    // Navigate to home after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: theme.colorScheme.primary,
            child: Center(
              child: Image.asset(
                'assets/world_girl.png',
                width: 327.17,
                height: 274,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,  // Position text at the bottom center
            child: Visibility(
              visible: _showWelcomeText,  // Control visibility based on the delay after 1sec
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),  // Adjust padding
                child: Text(
                  'Welcome',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
