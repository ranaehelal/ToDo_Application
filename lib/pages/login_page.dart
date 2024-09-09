import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  // Form key to validate form
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool _isEmailValid = false;// To track email validity
  bool _obscurePassword = true; // To track password visibility
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
                ),
              ),
            ),
            Positioned(
              top: 281,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration:  BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                width: double.infinity,
                height: double.infinity,
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 35),
                      Text('Log In',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              color: theme.colorScheme.secondary,
                              fontSize: 30,
                              fontWeight: FontWeight.w500
                          )
                      ),
                      SizedBox(height: 35),

                      // Form starts here
                      Form(
                        key: _formKey,  // Attach form key
                        child: Column(
                          children: [
                            // Email Field with validation
                            TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                labelStyle: TextStyle(color: theme.colorScheme.secondary),
                                filled: true,
                                fillColor: Colors.white,
                                suffixIcon: _isEmailValid ?
                                Container(
                                  width: 15,
                                  height: 15,
                                  decoration:  BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xff629677),
                                  ),
                                    child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 17,
                                  ),
                                )
                                    : null,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  setState(() {
                                    _isEmailValid = false;
                                  });
                                  return 'Please enter your email';

                                }
                                // Simple email regex validation
                                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(value)) {
                                  setState(() {
                                    _isEmailValid = false;
                                  });
                                  return 'Please enter a valid email';
                                }
                                setState(() {
                                  _isEmailValid = true;  // Set email as valid
                                });
                                return null;
                              },
                            ),
                            SizedBox(height: 20),

                            // Password Field with validation
                            TextFormField(
                              controller: passwordController,
                              obscureText: _obscurePassword,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(color: theme.colorScheme.secondary),
                                filled: true,
                                fillColor: Colors.white,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                                    color: theme.colorScheme.secondary,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscurePassword = !_obscurePassword; // Toggle password visibility
                                    });
                                  },
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),

                      // Proceed Button with validation check
                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, proceed with the login action
                            Navigator.pushReplacementNamed(context, '/home');
                          }
                        },
                        child: Image.asset(
                          'assets/btn/primary.png',  // Add your image asset here
                          width: 342,
                          height: 68,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: 70,
                left: 127,
                child: Container (
                  child: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        const TextSpan(
                          text: 'Newbie? ',  // Part of the text with a different style
                          style: TextStyle(
                            color: Color(0xff796c94),  // Text color
                            fontWeight: FontWeight.bold,  // Font weight
                            fontSize: 16,  // Font size
                          ),
                        ),
                        TextSpan(
                          text: ' Create Account.',  // Another part of the text
                          style: TextStyle(
                            fontWeight: FontWeight.bold,  // Font weight

                            color: theme.colorScheme.secondary,  // Different text color
                            fontSize: 16,  // Font size
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print('Create Account tapped');
                               Navigator.pushReplacementNamed(context, '/signup');
                            },
                        ),
                      ],
                    ),
                  )
                  ,
                )
            )
          ],
        ),
      ),
    );
  }
}
