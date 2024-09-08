import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Container(
        color: theme.colorScheme.primary,
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 56,
              left: 196,
              child: Image.asset(
                'assets/world_girl.png',
                width: 327.17,
                height: 274,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              top: 174,
              left: 36,
              child: Text(
                'Welcome \n Back!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),            ),
            ),
            Positioned(
              top: 281,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                width: double.infinity,
                height: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 35),
                      Text('Log In',
                          style: TextStyle(fontFamily:'Poppins', color:theme.colorScheme.secondary, fontSize: 30, fontWeight: FontWeight.w500)),
                      SizedBox(height: 35),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color: theme.colorScheme.secondary),
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(color: theme.colorScheme.secondary),
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('PROCEED'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                          textStyle: TextStyle(fontSize: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Newbie? Create Account',
                        style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                    ),
                  ),
                ),
              ),],
        ),
      ),
    );
  }
}
