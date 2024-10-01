import 'package:flutter/material.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/presendation/screen%20home/screen_home.dart';
import 'package:restaurant_kot/presendation/screen%20login/screen_settings.dart';
import 'package:restaurant_kot/presendation/widgets/buttons.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;

  void _login() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Simulate a login delay
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          _isLoading = false;
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
            return HomeScreen();
          },));
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login successful!')),
        );
        // Navigate to another page after login
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainclrbg,
        body: Stack(
          children: [
            ListView(
              children: [
                Image.asset(
                  'assets/img/loginpage/login.jpg',
                  fit: BoxFit.contain,
                ),
                Container(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 270,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 35, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18.0),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 202, 202, 202)
                              .withOpacity(0.3),
                          blurRadius: 15,
                          spreadRadius: 5,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: mainclr,
                              ),
                            ),
                          ),
                          SizedBox(height: 30),
                          // Username Field
                          TextFormField(
                            controller: _usernameController,
                            decoration: InputDecoration(
                              labelText: 'Username',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                    color: const Color.fromARGB(
                                        255, 192, 192, 192)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                    color: const Color.fromARGB(
                                        255, 192, 192, 192)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                    color: const Color.fromARGB(
                                        255, 192, 192, 192)),
                              ),
                              prefixIcon: Icon(Icons.person),
                              prefixIconColor: mainclr, // Set the icon color
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your username';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 16),
// Password Field
                          TextFormField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                    color: const Color.fromARGB(
                                        255, 192, 192, 192)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                    color: const Color.fromARGB(
                                        255, 192, 192, 192)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                    color: const Color.fromARGB(
                                        255, 192, 192, 192)),
                              ),
                              prefixIcon: Icon(Icons.lock),
                              prefixIconColor: mainclr, // Set the icon color
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: 20),
                          // Login Button
                          _isLoading
                              ? Center(child: CircularProgressIndicator())
                              : MainButton(label: 'Login', onpress: _login),
                          const SizedBox(
                            height: 5,
                          ),

                          TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return SettingsPage();
                                  },
                                ));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Settings  ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: mainclr),
                                  ),
                                  Icon(
                                    Icons.arrow_right_rounded,
                                    color: mainclr,
                                  )
                                ],
                              )),
                          // ElevatedButton(
                          //     style: ElevatedButton.styleFrom(
                          //       backgroundColor:
                          //           boxbgwhite, // Set the button background color

                          //       minimumSize: Size(
                          //           double.infinity, 55), // Full-width button
                          //       shape: RoundedRectangleBorder(
                          //         side: BorderSide(color: mainclr),
                          //         borderRadius: BorderRadius.circular(
                          //             20), // Border radius of 10
                          //       ),
                          //     ),
                          //     onPressed: () {},
                          //     child: Text(
                          //       'Settings',
                          //       style: TextStyle(fontWeight: FontWeight.bold),
                          //     )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
