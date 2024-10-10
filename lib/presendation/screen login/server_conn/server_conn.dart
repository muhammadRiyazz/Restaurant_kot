import 'package:flutter/material.dart';
import 'package:restaurant_kot/consts/colors.dart';
import 'package:restaurant_kot/presendation/widgets/buttons.dart';

class ServerConnectionPage extends StatelessWidget {
  // Controllers for text fields
  final _serverFormKey = GlobalKey<FormState>();

  // Function to validate and submit the server connection form
  // void _submitServerForm() {
  //   if (_serverFormKey.currentState!.validate()) {
  //     Navigator.pop(context);
  //     Navigator.pop(context);
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Server details saved successfully!')),
  //     );
  //   }
  // }
  TextEditingController ipController = TextEditingController();
  TextEditingController databaseController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController portController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainclrbg,
      appBar: AppBar(
          actions: [
            SizedBox(
              width: 60,
            )
          ],
          title: Center(
              child: Text(
            'Server Connection',
            style: TextStyle(fontSize: 16),
          ))),
      body: Form(
        key: _serverFormKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: boxbgwhite,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: ipController,
                        decoration: InputDecoration(labelText: 'IP Address'),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter IP Address';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),

                      // Database Name
                      TextFormField(
                        controller: databaseController,
                        decoration: InputDecoration(labelText: 'Database Name'),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Database Name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),

                      // Username
                      TextFormField(
                        controller: usernameController,
                        decoration: InputDecoration(labelText: 'Username'),
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Username';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),

                      // Password
                      TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(labelText: 'Password'),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Password';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),

                      // Port Number
                      TextFormField(
                        controller: portController,
                        decoration: InputDecoration(labelText: 'Port Number'),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Port Number';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),

                      // Confirm Button
                      MainButton(
                        onpress: () {},
                        label: 'Confirm',
                      ),
                    ],
                  ),
                ),
              ),
            )
            // IP Address
          ],
        ),
      ),
    );
  }
}
