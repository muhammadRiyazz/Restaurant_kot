import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_kot/application/server%20conn/server_conn_bloc.dart';
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
          actions: const [
            SizedBox(
              width: 60,
            )
          ],
          title: const Center(
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
                      BlocConsumer<ServerConnBloc, ServerConnState>(
                        listener: (context, state) {
   if (state.conn) {
Navigator.popUntil(context, (route) => route.isFirst);
                          }

                          if (state.connErrorMsg != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: mainclr,
                                  content: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Sorry!',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Text(
                                          state.passcodeErrorMsg.toString(),
                                          style: const TextStyle(fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  )),
                            );
                          }                        },
                        builder: (context, state) {
                          return     state.isLoading
                              ? const LinearProgressIndicator(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  color: mainclr,
                                )
                              : MainButton(
                            onpress: () {
                              if (_serverFormKey.currentState!.validate()) {}
                            },
                            label: 'Confirm',
                          );
                        },
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
